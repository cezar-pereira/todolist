import 'package:flutter/material.dart';
import 'package:todolist/app/modules/home/Components.dart';
import 'package:todolist/app/modules/home/home_controller.dart';
import 'package:todolist/app/modules/home/home_module.dart';

class HomePage extends StatelessWidget with Components {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeModule.to.get();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.settings, size: 28),
        ),
        title: ShaderMask(
          shaderCallback: (rect) {
            return RadialGradient(
              center: Alignment.bottomCenter,
              radius: 3,
              colors: <Color>[Colors.white, Colors.cyan.withOpacity(0.6)],
            ).createShader(rect);
          },
          child: Text("Lembre-me", style: TextStyle(fontSize: 25)),
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
                          print(homeController.categories[index]["tasks"].length);
                      return categories(
                        name: homeController.categories[index]["name"],
                        icon: IconData(
                            homeController.categories[index]["codePointIcon"],
                            fontFamily: 'MaterialIcons'),
                        amount: homeController.categories[index]["tasks"].length,
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
//adicionada classe com codePoint dos icones, criado repository das categorias com lista temporaria para listar na homePage