import 'package:flutter/material.dart';

class Components {
  categoryCount({@required IconData icon, @required int text}) {
    return Row(
      children: <Widget>[
        Icon(icon),
        SizedBox(width: 8),
        Text(text.toString()),
      ],
    );
  }

}
