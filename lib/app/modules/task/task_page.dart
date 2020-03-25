import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist/app/modules/category/category_controller.dart';
import 'package:todolist/app/modules/home/home_module.dart';
import 'package:todolist/app/modules/task/Components.dart';
import 'package:todolist/app/modules/task/block_date_time.dart';
import 'package:todolist/app/modules/task/task_controller.dart';
import 'package:todolist/app/shared/models/category.dart';
import 'package:todolist/app/shared/models/task.dart';
import 'package:todolist/app/shared/my_app_bar.dart';

class TaskPage extends StatelessWidget with ComponentsTask{
  final categoryOrTask;
  TaskPage({Key key, this.categoryOrTask}) {
    fillValues();
  }
  final TextEditingController textControllerName = TextEditingController();
  final TextEditingController textControllerDescription = TextEditingController();

  final SizedBox spacingGroups = SizedBox(height: 24);

  final TextStyle textStyle =
      TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.65));

  final TaskController taskController = HomeModule.to.get();

  fillValues() {
    if (categoryOrTask.runtimeType == Category
      ..runtimeType) {
      taskController.cleanPage();
      taskController.setCategory(categoryOrTask.name);
    } else if (categoryOrTask.runtimeType == Task
      ..runtimeType) {
      textControllerName.text = categoryOrTask.title;
      textControllerDescription.text = categoryOrTask.description;
      taskController.fillTask(categoryOrTask);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map> priorities = [
      {"title": "Prioridade#0", "color": Colors.red},
      {"title": "Prioridade#1", "color": Colors.orange},
      {"title": "Prioridade#2", "color": Colors.yellow},
      {"title": "Prioridade#3", "color": Colors.blue},
    ];
    return Scaffold(
      appBar: MyAppBar(),
      body: SafeArea(
        
        child: Observer(
          builder: (context) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    spacingGroups,
                    Text(
                      "Nome",
                      style: textStyle,
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 40,
                      child: CupertinoTextField(
                        controller: textControllerName,
                        onChanged: (value) =>
                            taskController.setTitle(value),
                        placeholder: "Nome",
                      ),
                    ),
                    Text(
                      (taskController.getTitle().length < 5) == true
                          ? 'Nome deve ter pelo menos 5 caracteres'
                          : "",
                      style: TextStyle(color: Colors.red),
                    ),
                    
                    spacingGroups,
                    BlockDateTime(),
                    spacingGroups,
                    Container(
                      height: 130,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Categoria",
                                        style: textStyle,
                                      ),
                                      Text("▼")
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Scrollbar(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: List.generate(
                                          Modular.get<CategoryController>().categories.value.length,
                                          (index) {
                                            return GestureDetector(
                                              onTap: () {
                                                taskController
                                                    .setCategory(
                                                        Modular.get<CategoryController>().categories.value[index]
                                                            .name);
                                              },
                                              child: buildItemCategory(
                                                colorSelected: taskController
                                                            .getCategorySelected() ==
                                                        Modular.get<CategoryController>().categories.value[index]
                                                            .name
                                                    ? Colors.cyan
                                                    : Colors.transparent,
                                                title: Modular.get<CategoryController>()
                                                    .categories.value[index].name,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Flexible(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Prioridade",
                                    style: textStyle,
                                  ),
                                  Column(
                                    children: List.generate(
                                      priorities.length,
                                      (index) {
                                        return GestureDetector(
                                          onTap: () {
                                            taskController
                                                .setImportance(index);
                                          },
                                          child: buildItemPriority(
                                              title: priorities[index]["title"],
                                              color: priorities[index]["color"],
                                              colorSelected: taskController
                                                          .getImportanceSelected() ==
                                                      index
                                                  ? priorities[index]["color"]
                                                  : Colors.transparent),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    spacingGroups,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Descrição",
                          style: textStyle,
                        ),
                        SizedBox(height: 8),
                        CupertinoTextField(
                          keyboardType: TextInputType.text,
                          onChanged: (value) =>
                              taskController.setDescription(value),
                          placeholder: "Descrição",
                          controller: textControllerDescription,
                          maxLength: 255,
                          maxLines: 4,
                        ),
                        SizedBox(height: 60)
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomSheet: Container(
        height: 50,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 5),
          ],
          color: Colors.white,
        ),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onTap: () {
            // Modular.to
            // if (textControllerName.text.length >= 5) {
            // taskController.save();
            // }
          },
          child: Text(
            "ADICIONAR",
            style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 5),
          ),
        ),
      ),
    );
  }
}
