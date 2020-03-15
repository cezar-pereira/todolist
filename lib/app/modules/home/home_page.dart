import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist/app/modules/home/Components.dart';
import 'package:todolist/app/modules/home/home_controller.dart';
import 'package:todolist/app/modules/home/home_module.dart';
import 'package:todolist/app/shared/list_icons.dart';
import 'package:todolist/app/shared/my_app_bar.dart';

class HomePage extends StatelessWidget with Components {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeModule.to.get();
    return Scaffold(
      appBar: MyAppBar(
        leading: GestureDetector(
          child: Icon(Icons.settings, size: 28),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white30,
              child: Icon(Icons.person),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                // ProfileWidget(),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 12),
                      Text(
                        "Olá Cézar",
                        style: TextStyle(fontSize: 23),
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                      SizedBox(height: 12),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.15),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Container(
                          height: 40,
                          child: CupertinoTextField(
                            placeholder: "Procurar atividades",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    period(text: "Hoje"),
                    period(text: "Semana"),
                    period(text: "Mês"),
                  ],
                ),
                SizedBox(height: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.count(
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 3 : 2,
                      children: List.generate(homeController.categories.length,
                          (index) {
                        return GestureDetector(
                          child: categories(
                            name: homeController.categories[index].name,
                            icon: IconData(
                                homeController.categories[index].codePointIcon,
                                fontFamily: 'MaterialIcons'),
                            amount:
                                homeController.categories[index].tasks.length,
                          ),
                          onTap: () {
                            Modular.to.pushNamed("taskList",
                                arguments: homeController.categories[index]);
                          },
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
            Container(
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
                  onTap: () {
                    showDialogAddCategory(context);
                  },
                  child: Icon(Icons.add, size: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
