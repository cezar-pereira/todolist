import 'package:todolist/app/modules/add_update_task/add_update_task_controller.dart';
import 'package:todolist/app/modules/home/home_page.dart';

import 'package:todolist/app/modules/home/profile/profile_controller.dart';
import 'package:todolist/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist/app/shared/repositories/categories_repository.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        //CONTROLLERS
        Bind((i) => ProfileController()),
        Bind((i) => HomeController(i.get<CategoriesRepository>())),
        Bind((i) => AddUpdateTaskController(i.get<CategoriesRepository>())),
        // REPOSITORIES
        Bind((i) => CategoriesRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
