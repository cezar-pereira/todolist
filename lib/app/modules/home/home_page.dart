import 'package:flutter/material.dart';
import 'package:todolist/app/modules/home/Components.dart';
import 'package:todolist/app/modules/home/home_controller.dart';
import 'package:todolist/app/modules/home/home_module.dart';
import 'package:todolist/app/modules/home/profile/profile_widget.dart';

class HomePage extends StatelessWidget with Components {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeModule.to.get();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Column(
            children: <Widget>[
              ProfileWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  period(text: "Hoje"),
                  period(text: "Semana"),
                  period(text: "Mês"),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: GridView.count(
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    crossAxisCount: 2,
                    children: List.generate(7, (index) {
                      return categories(title: "Home", icon: Icons.home, amount: 10);
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
