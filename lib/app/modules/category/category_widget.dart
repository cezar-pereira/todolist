import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist/app/app_module.dart';
import 'package:todolist/app/modules/category/category_controller.dart';
import 'package:todolist/app/shared/list_icons.dart';
import 'package:todolist/app/shared/models/category.dart';

class CategoryWidget {
  TextEditingController controller = TextEditingController();
  CategoryController categoryController = AppModule.to.get();

  show(context, {Category category}) {
    categoryController.fillValues(category: category);
    TextEditingController controller = TextEditingController();
    controller.text = categoryController.getNameCategory;

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Observer(
          builder: (context) {
            return AlertDialog(
              title: Text(category == null
                  ? 'Adicionar categoria'
                  : 'Atualizar categoria'),
              content: Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Nome'),
                    SizedBox(height: 8),
                    CupertinoTextField(
                      controller: controller,
                      onChanged: (value) {
                        categoryController.setNameCategory(value);
                        categoryController.setMessageError("");
                      },
                      maxLength: 30,
                    ),
                    Text(
                      categoryController.getMessageError,
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
                                categoryController.setIconSelected(
                                    ListIcons.listIcons[index]);
                              },
                              child: Container(
                                color: categoryController.getIconSelected ==
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
                  onPressed: () async {
                    if (categoryController.getNameCategory.length >= 3) {
                      BotToast.showLoading();
                      bool result;
                      if (category == null) {
                        result = await categoryController.addCategory();
                      } else {
                        result = await categoryController.updateCategory();
                      }

                      if (result) {
                        Modular.to.pushNamed("/");
                      } else {
                        categoryController
                            .setMessageError("Categoria já existe!");
                      }
                    } else {
                      categoryController.setMessageError(
                          "Nome deve ter pelo menos 3 caracteres.");
                    }
                    BotToast.closeAllLoading();
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
