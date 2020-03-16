import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key key, Widget title, Widget leading, List<Widget> actions})
      : super(
            key: key,
            title: ShaderMask(
              shaderCallback: (rect) {
                return RadialGradient(
                  center: Alignment.bottomCenter,
                  radius: 3,
                  colors: <Color>[Colors.white, Colors.cyan.withOpacity(0.6)],
                ).createShader(rect);
              },
              child: Text("Remember", style: TextStyle(fontSize: 25)),
            ),
            leading: leading,
            actions: actions);
}
