import 'package:flutter/material.dart';
import 'package:todolist/app/shared/models/task.dart';

class Components {
  itemTask({@required Task task}) {
    Color color;

    switch (task.importance) {
      case 0:
        color = Colors.red;
        break;
      case 1:
        color = Colors.orange;
        break;
      case 2:
        color = Colors.yellow;
        break;
      case 3:
        color = Colors.blue;
        break;
      default:
    }

    return Container(
      height: 70,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: <BoxShadow>[
          BoxShadow(blurRadius: 3, spreadRadius: 2, color: Colors.black12)
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                topLeft: Radius.circular(8),
              ),
              color: color,
            ),
            width: 6,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(task.date),
                      SizedBox(width: 8),
                      Text(task.hour),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: task.done,
                        onChanged: (value) {},
                      ),
                      Expanded(
                        child: Text(
                          task.title,
                          style: TextStyle(
                              fontSize: 18,
                              decoration: task.done == true
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
