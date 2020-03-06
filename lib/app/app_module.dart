import 'package:todolist/app/modules/taskList/task_list/task_list_controller.dart';
import 'package:todolist/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:todolist/app/app_widget.dart';
import 'package:todolist/app/modules/home/home_module.dart';
import 'package:todolist/app/modules/taskList/task_list/task_list_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TaskListController()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
        Router(
          '/taskList',
          child: (context, args) => TaskListWidget(
            category: args.data,
          ),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
