import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todolist/app/modules/taskList/task_list/components.dart';
import 'package:todolist/app/shared/models/category.dart';

class TaskListWidget extends StatelessWidget with Components {
  final Category category;

  const TaskListWidget({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
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
                          "${category.tasks.length} ${category.tasks.length > 1 ? "tarefas" : "tarefa"}")
                    ],
                  ),
                  Text(
                    category.name,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 6),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: category.tasks.length,
                itemBuilder: (context, index) {
                  return itemTask(task: category.tasks[index]);
                },
              ),
            ),
          ],
        ));
  }
}
