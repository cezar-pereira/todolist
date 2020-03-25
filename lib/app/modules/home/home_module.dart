import 'package:todolist/app/modules/add_update_task/add_update_task_controller.dart';
import 'package:todolist/app/modules/home/home_page.dart';
import 'package:todolist/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        //CONTROLLERS
        Bind((i) => HomeController()),
        Bind((i) => AddUpdateTaskController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
