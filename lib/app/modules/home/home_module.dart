import 'package:todolist/app/modules/home/home_repository.dart';
import 'package:todolist/app/modules/home/profile/profile_controller.dart';

import 'package:todolist/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeRepository()),
        //CONTROLLERS
        Bind((i) => ProfileController()),
        Bind((i) => HomeController(i.get<HomeRepository>())),
        //REPOSITORIES
        Bind((i) => HomeRepository()),

      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
