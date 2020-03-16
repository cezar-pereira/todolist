import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todolist/app/modules/home/home_controller.dart';
import 'package:todolist/app/modules/home/home_module.dart';
import 'package:todolist/app/shared/list_icons.dart';

class Components {
  final HomeController homeController = HomeModule.to.get<HomeController>();

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
          ]),
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

  Future<void> showDialogAddCategory(context) async {
    homeController.fillValuesDefault();
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Observer(
          builder: (context) {
            return AlertDialog(
              title: Text('Adicionar categoria'),
              content: Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Nome'),
                    SizedBox(height: 8),
                    CupertinoTextField(
                      onChanged: (value) =>
                          homeController.setNameCategory(value),
                    ),
                    Text(
                      homeController.getNameCategory.length < 3
                          ? 'Nome deve ter mais de 3 caracteres'
                          : '',
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(height: 8),
                    Text('Icone:'),
                    Expanded(
                      child: Scrollbar(
                        child: GridView.count(
                          crossAxisCount: 4,
                          children: List.generate(ListIcons.listIcons.length,
                              (index) {
                            return GestureDetector(
                              onTap: () {
                                homeController.setIconSelected(
                                    ListIcons.listIcons[index]);
                              },
                              child: Container(
                                color: homeController.getIconSelected ==
                                        ListIcons.listIcons[index]
                                    ? Colors.black38
                                    : Colors.transparent,
                                child: Icon(IconData(ListIcons.listIcons[index],
                                    fontFamily: 'MaterialIcons')),
                              ),
                            );
                          }),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Confirmar'),
                  onPressed: () {
                    if (homeController.getNameCategory.length >= 3) {
                      homeController.save();
                      Navigator.of(context).pop();
                    }
                  },
                ),
                FlatButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
