import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todolist/app/modules/home/home_controller.dart';
import 'package:todolist/app/modules/home/home_module.dart';

class Components {
  HomeController homeController = HomeModule.to.get<HomeController>();
  period({@required String text}) {
    return Observer(
      builder: (BuildContext context) {
        return GestureDetector(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              border: BorderDirectional(
                bottom: BorderSide(
                    width: 2,
                    color: homeController.period == text
                        ? Colors.black54
                        : Colors.black26),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
          onTap: () => homeController.setPeriod(text),
        );
      },
    );
  }
}
