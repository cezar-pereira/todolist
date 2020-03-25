import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist/app/modules/category/category_controller.dart';
import 'package:todolist/app/modules/category/category_widget.dart';
import 'package:todolist/app/modules/taskList/task_list/components.dart';
import 'package:todolist/app/modules/taskList/task_list/task_list_controller.dart';
import 'package:todolist/app/shared/models/category.dart';
import 'package:todolist/app/shared/my_app_bar.dart';

class TaskListWidget extends StatefulWidget {
  final Category category;

  TaskListWidget({Key key, @required this.category});

  @override
  _TaskListWidgetState createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget>
    with ComponentsTaskList {
  ScrollController scrollController;
  double space = 0;

  @override
  void initState() {
    scrollController = ScrollController()
      ..addListener(() {
        _scrollListener();
      });
    super.initState();
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
    CategoryController categoryController = Modular.get<CategoryController>();
    return Scaffold(
      appBar: MyAppBar(),
      body: SafeArea(
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
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
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
                                "${widget.category.tasks.length} ${widget.category.tasks.length > 1 ? "tarefas" : "tarefa"}"),
                          ],
                        ),
                        Tooltip(
                          message: widget.category.name,
                          child: Text(
                            "${widget.category.name}",
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
                      itemCount: widget.category.tasks.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Modular.to.pushNamed("addUpdateTask",
                                arguments: widget.category.tasks[index]);
                          },
                          child: itemTask(task: widget.category.tasks[index]),
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
                  onTap: () {
                    Modular.to
                        .pushNamed("addUpdateTask", arguments: widget.category);
                  },
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
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CupertinoButton(
                child: Text(
                  "Editar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  CategoryWidget()..show(context, category: widget.category);
                }),
            CupertinoButton(
              child: Text(
                "Deletar",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () async {
                return showDialog<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                          "Realmente deseja deletar categoria ${widget.category.name}?"),
                      content: SingleChildScrollView(
                        child: Text(
                            "Esta ação não pode ser desfeita e todas as atividades relacionadas a ela serão deletadas."),
                      ),
                      actions: <Widget>[
                        CupertinoButton(
                            child: Text("Deletar"),
                            onPressed: () async {
                              if (await categoryController
                                  .deleteCategory(widget.category)) {
                                successBotToastDeleteCategory();
                                Modular.to.pushNamed("/");
                              } else {
                                errorBotToastDeleteCategory();
                                Modular.to.pushNamed("/");
                              }
                            }),
                        CupertinoButton(
                          child: Text("Cancelar"),
                          onPressed: () {
                            Modular.to.pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  successBotToastDeleteCategory() {
    return BotToast.showNotification(
      duration: Duration(seconds: 2),
      leading: (_) {
        return Icon(
          Icons.done,
          color: Colors.green,
        );
      },
      title: (_) {
        return RichText(
            text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 16),
          children: <TextSpan>[
            TextSpan(text: "Categoria "),
            TextSpan(
                text: "${widget.category.name} ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: "removida com sucesso."),
          ],
        ));
      },
    );
  }

  errorBotToastDeleteCategory() {
    return BotToast.showNotification(
      duration: Duration(seconds: 2),
      leading: (_) {
        return Icon(
          Icons.close,
          color: Colors.red,
        );
      },
      title: (_) {
        return RichText(
            text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 16),
          children: <TextSpan>[
            TextSpan(text: "Erro ao remover a "),
            TextSpan(text: "Categoria "),
            TextSpan(
                text: "${widget.category.name}.",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ));
      },
    );
  }
}
