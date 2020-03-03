import 'package:flutter/material.dart';
import 'package:todolist/app/modules/home/profile/Components.dart';

class ProfileWidget extends StatelessWidget with Components {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        GestureDetector(
          child: Icon(Icons.settings, size: 28),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          margin: EdgeInsets.only(top: 40, bottom: 16),
          decoration: BoxDecoration(
            color: Color(0xFF80cbc4),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 100,
                  ),
                  Expanded(
                    child: Text(
                      "Lorem Ipsum is simply dummy",
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  categoryCount(icon: Icons.person, text: 100),
                  categoryCount(icon: Icons.home, text: 100),
                  categoryCount(icon: Icons.work, text: 100),
                  categoryCount(icon: Icons.school, text: 100),
                ],
              ),
            ],
          ),
        ),
        Container(
          child: Positioned(
            left: 10,
            top: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xFF4f9a94),
              ),
              child: Icon(
                Icons.person,
                size: 80,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
