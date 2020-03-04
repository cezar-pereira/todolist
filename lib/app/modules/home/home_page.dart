import 'package:flutter/material.dart';
import 'package:todolist/app/modules/home/Components.dart';
import 'package:todolist/app/modules/home/profile/profile_widget.dart';

class HomePage extends StatelessWidget with Components {
  @override
  Widget build(BuildContext context) {
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
            ],
          ),
        ),
      ),
    );
  }
}
