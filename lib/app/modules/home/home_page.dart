import 'package:flutter/material.dart';
import 'package:todolist/app/modules/home/profile/profile_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
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
                children: <Widget>[
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
