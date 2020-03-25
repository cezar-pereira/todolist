import 'package:todolist/app/modules/category/category_controller.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:todolist/app/modules/add_update_task/add_update_task_page.dart';
import 'package:todolist/app/modules/taskList/task_list/task_list_controller.dart';
import 'package:todolist/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:todolist/app/app_widget.dart';
import 'package:todolist/app/modules/home/home_module.dart';
import 'package:todolist/app/modules/taskList/task_list/task_list_widget.dart';
import 'package:todolist/app/shared/repositories/categories_hasura_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) =>
            CategoryController(i.get<CategoriesHasuraRepository>())),
        Bind((i) => AppController()),
        //Other
        Bind((i) =>
            HasuraConnect("https://nano-remember.herokuapp.com/v1/graphql")),
        // REPOSITORIES
        Bind((i) => CategoriesHasuraRepository(i.get<HasuraConnect>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
        Router('/taskList',
            child: (context, args) => TaskListWidget(
                  category: args.data,
                )),
        Router('/addUpdateTask',
            child: (context, args) =>
                AddUpdateTaskPage(categoryOrTask: args.data)),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
