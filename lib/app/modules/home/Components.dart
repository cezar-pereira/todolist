import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist/app/app_module.dart';
import 'package:todolist/app/modules/category/category_controller.dart';
import 'package:todolist/app/modules/category/category_widget.dart';
import 'package:todolist/app/modules/home/home_controller.dart';
import 'package:todolist/app/modules/home/home_module.dart';
import 'package:todolist/app/shared/models/category.dart';

enum settingsOptions { Sair }

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
      {@required String name,
      @required IconData icon,
      @required int amount,
      @required BuildContext context,
      @required int indexCategory}) {
    return Container(
      height: 100,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(10),
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
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    name.toUpperCase(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Arial"),
                    maxLines: 2,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    homeController.setEditDeleteIsVisible(
                        !homeController.getEditDeleteIsVisible);
                    homeController
                        .setIndexCategorySelectedForEditDelete(indexCategory);
                  },
                  child: Icon(Icons.more_vert),
                ),
              ],
            ),
            Text("Tarefas ($amount)"),
            Expanded(child: Container()),
            Container(
              alignment: Alignment.centerRight,
              child: Icon(icon),
            )
          ],
        ),
      ),
    );
  }

  bottomButton({@required BuildContext context}) {
    if (homeController.getEditDeleteIsVisible) {
      return Container(
        color: Colors.white,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CupertinoButton(
                child: Text(
                  "Editar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  CategoryWidget()
                    ..show(context,
                        category: categoryController.categories.value[
                            homeController
                                .getIndexCategorySelectedForEditDelete]);
                  homeController.setEditDeleteIsVisible(false);
                }),
            CupertinoButton(
              child: Text(
                "Deletar",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () async {
                homeController.setEditDeleteIsVisible(false);
                return showDialog<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                          "Realmente deseja deletar categoria ${categoryController.categories.value[homeController.getIndexCategorySelectedForEditDelete].name}?"),
                      content: SingleChildScrollView(
                        child: Text(
                            "Esta ação não pode ser desfeita e todas as atividades relacionadas a ela serão deletadas."),
                      ),
                      actions: <Widget>[
                        CupertinoButton(
                            child: Text("Deletar"),
                            onPressed: () async {
                              if (await categoryController.deleteCategory(
                                  categoryController.categories.value[homeController
                                      .getIndexCategorySelectedForEditDelete])) {
                                successBotToastDeleteCategory(
                                    category: categoryController
                                            .categories.value[
                                        homeController
                                            .getIndexCategorySelectedForEditDelete]);
                                Modular.to.pop();
                              } else {
                                errorBotToastDeleteCategory(
                                    category: categoryController
                                            .categories.value[
                                        homeController
                                            .getIndexCategorySelectedForEditDelete]);
                                Modular.to.pop();
                              }
                            }),
                        CupertinoButton(
                          child: Text("Cancelar"),
                          onPressed: () {
                            Modular.to.pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 3,
              color: Colors.black26,
            )
          ],
        ),
        width: 80,
        height: 50,
        child: Tooltip(
          message: "Adicionar categoria",
          child: GestureDetector(
            onTap: () async {
              CategoryWidget().show(context);
            },
            child: Icon(Icons.add, size: 25),
          ),
        ),
      );
    }
  }

  successBotToastDeleteCategory({@required Category category}) {
    homeController.setEditDeleteIsVisible(false);
    return BotToast.showNotification(
      duration: Duration(seconds: 2),
      leading: (_) {
        return Icon(
          Icons.done,
          color: Colors.green,
        );
      },
      title: (_) {
        return RichText(
            text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 16),
          children: <TextSpan>[
            TextSpan(text: "Categoria "),
            TextSpan(
                text: "${category.name} ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: "removida com sucesso."),
          ],
        ));
      },
    );
  }

  errorBotToastDeleteCategory({@required Category category}) {
    return BotToast.showNotification(
      duration: Duration(seconds: 2),
      leading: (_) {
        return Icon(
          Icons.close,
          color: Colors.red,
        );
      },
      title: (_) {
        return RichText(
            text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 16),
          children: <TextSpan>[
            TextSpan(text: "Erro ao remover a "),
            TextSpan(text: "Categoria "),
            TextSpan(
                text: "${category.name}.",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ));
      },
    );
  }
}
