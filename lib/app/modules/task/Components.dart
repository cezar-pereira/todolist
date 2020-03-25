import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComponentsTask {
  Widget buildItemPriority(
      {@required String title,
      @required Color color,
      @required Color colorSelected}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: color, width: 3)),
            padding: EdgeInsets.all(2),
            child: CircleAvatar(
              maxRadius: 5,
              backgroundColor: colorSelected,
            ),
          ),
          SizedBox(width: 4),
          Expanded(
            child: Tooltip(
              message: title,
              waitDuration: Duration(seconds: 1),
              child: Text(
                title,
                style: TextStyle(fontSize: 18),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItemCategory(
      {@required String title, @required Color colorSelected}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.cyan, width: 3),
            ),
            padding: EdgeInsets.all(2),
            child: CircleAvatar(
              maxRadius: 5,
              backgroundColor: colorSelected,
            ),
          ),
          SizedBox(width: 4),
          Expanded(
            child: Tooltip(
              waitDuration: Duration(seconds: 1),
              message: title,
              child: Text(
                title,
                style: TextStyle(fontSize: 18),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
