import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todolist/app/app_module.dart';
import 'package:todolist/app/modules/category/category_controller.dart';
import 'package:todolist/app/modules/home/home_controller.dart';
import 'package:todolist/app/modules/home/home_module.dart';

class ComponentsHome {
  final HomeController homeController = HomeModule.to.get<HomeController>();
  final CategoryController categoryController =
      AppModule.to.get<CategoryController>();

  period({@required String text}) {
    return Observer(
      builder: (BuildContext context) {
        return GestureDetector(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              border: BorderDirectional(
                bottom: BorderSide(
                    width: homeController.getPeriod == text ? 3 : 2,
                    color: homeController.getPeriod == text
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

  categories(
      {@required String name, @required IconData icon, @required int amount}) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 3,
            color: Colors.black12,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name.toUpperCase(),
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "Arial"),
            maxLines: 2,
          ),
          Text("Tarefas (${amount.toString()})"),
          Expanded(child: Container()),
          Container(
            alignment: Alignment.centerRight,
            child: Icon(icon),
          )
        ],
      ),
    );
  }
}
