import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist/app/modules/category/category_controller.dart';
import 'package:todolist/app/modules/task/task_controller.dart';
import 'package:todolist/app/modules/taskList/task_list/components.dart';
import 'package:todolist/app/shared/my_app_bar.dart';

class TaskListWidget extends StatefulWidget {
  final int categoryIndex;

  TaskListWidget({Key key, @required this.categoryIndex});

  @override
  _TaskListWidgetState createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget>
    with ComponentsTaskList {
  ScrollController scrollController;
  CategoryController categoryController;
  TaskController taskController;
  double space = 0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        _scrollListener();
      });
    categoryController = Modular.get<CategoryController>();
    taskController = Modular.get<TaskController>();
  }

  _scrollListener() {
    setState(() {
      if (scrollController.position.pixels <= 40) {
        space = scrollController.position.pixels;
      } else if (scrollController.position.pixels < 0) {
        space = 0;
      } else {
        space = 40;
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Observer(builder: (_) {
        return SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.11)
                          ],
                        ),
                        border: BorderDirectional(
                          bottom: BorderSide(width: 0.5, color: Colors.black38),
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Categoria:",
                                style: TextStyle(fontSize: 24),
                              ),
                              Text(
                                  "${categoryController.categories.value[widget.categoryIndex].tasks.length} ${categoryController.categories.value[widget.categoryIndex].tasks.length > 1 ? "tarefas" : "tarefa"}"),
                            ],
                          ),
                          Tooltip(
                            message: categoryController
                                .categories.value[widget.categoryIndex].name,
                            child: Text(
                              "${categoryController.categories.value[widget.categoryIndex].name}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40 - space,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: categoryController.categories
                            .value[widget.categoryIndex].tasks.length,
                        itemBuilder: (context, index) {
                          return Dismissible(

                            background: Container(
                              padding: EdgeInsets.only(left: 12),
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                            direction: DismissDirection.startToEnd,
                            confirmDismiss: (DismissDirection direction) async {
                              return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Confirmação"),
                                      content: RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:
                                                      "Tem certeza que deseja deletar a atividade "),
                                              TextSpan(
                                                  text:
                                                      "${categoryController.categories.value[widget.categoryIndex].tasks[index].title}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              TextSpan(text: "?"),
                                            ]),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                            onPressed: () {
                                              taskController.deleteTask(
                                                  task: categoryController
                                                      .categories
                                                      .value[
                                                          widget.categoryIndex]
                                                      .tasks[index]);
                                              Navigator.of(context).pop(true);
                                            },
                                            child: const Text("CONFIRMAR")),
                                        FlatButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: const Text("CANCELAR"),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            key: Key(categoryController.categories
                                .value[widget.categoryIndex].tasks[index].id),
                            child: GestureDetector(
                              onTap: () {
                                Modular.to.pushNamed("addUpdateTask",
                                    arguments: categoryController
                                        .categories
                                        .value[widget.categoryIndex]
                                        .tasks[index]);
                              },
                              child: itemTask(
                                  task: categoryController
                                      .categories
                                      .value[widget.categoryIndex]
                                      .tasks[index]),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 60,
                left: MediaQuery.of(context).size.width - 70,
                child: Opacity(
                  opacity:
                      ((space * 2 / 100) > 0) ? (1 - (space * 2.5 / 100)) : 1,
                  child: GestureDetector(
                    onTap: () => Modular.to.pushNamed("addUpdateTask",
                        arguments: categoryController
                            .categories.value[widget.categoryIndex]),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      maxRadius: 30,
                      child: Icon(
                        Icons.add,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
