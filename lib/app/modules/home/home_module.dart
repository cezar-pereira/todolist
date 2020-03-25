import 'package:todolist/app/modules/home/home_page.dart';
import 'package:todolist/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist/app/modules/task/task_controller.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        //CONTROLLERS
        Bind((i) => HomeController()),
        Bind((i) => TaskController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
