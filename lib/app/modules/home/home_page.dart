import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist/app/modules/home/Components.dart';
import 'package:todolist/app/modules/home/home_controller.dart';
import 'package:todolist/app/modules/home/home_module.dart';
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
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // ProfileWidget(),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 12),
                    Text(
                      "Olá Cézar",
                      style: TextStyle(fontSize: 23),
                    ),
                    SizedBox(height: 12),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: TextField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                          suffixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                          hintText: "Procurar atividades",
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
                    crossAxisCount: 2,
                    children: List.generate(homeController.categories.length,
                        (index) {
                      return GestureDetector(
                        child: categories(
                          name: homeController.categories[index].name,
                          icon: IconData(
                              homeController.categories[index].codePointIcon,
                              fontFamily: 'MaterialIcons'),
                          amount: homeController.categories[index].tasks.length,
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
        ),
      ),
    );
  }
}
