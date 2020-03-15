import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todolist/app/modules/add_update_task/add_update_task_controller.dart';
import 'package:todolist/app/modules/add_update_task/list_hours_minutes.dart';
import 'package:todolist/app/modules/add_update_task/list_months_days.dart';
import 'package:todolist/app/modules/home/home_module.dart';

class BlockDateTime extends StatelessWidget {


  final AddUpdateTaskController addUpdateTaskController = HomeModule.to.get();
  final TextStyle textStyle =
      TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.65));
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Container(
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Hora",
                      style: textStyle,
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            blurRadius: 3,
                            color: Colors.black12,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: listWheelScrollView(
                                initial: addUpdateTaskController.getHour(),
                                list: ListHoursMinutes.hours,
                                type: "hour"),
                          ),
                          Text(":", style: textStyle),
                          Flexible(
                            flex: 1,
                            child: listWheelScrollView(
                                initial: addUpdateTaskController.getMinutes(),
                                list: ListHoursMinutes.minutes,
                                type: "minutes"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20),
            Flexible(
              flex: 1,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Data",
                      style: textStyle,
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            blurRadius: 3,
                            color: Colors.black12,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: listWheelScrollView(
                              initial: addUpdateTaskController.getDay(),
                              list: ListMonthsDays.days,
                              type: "day",
                              length: DateTime(
                                      DateTime.now().year,
                                      int.parse(addUpdateTaskController
                                              .getMonth()) +
                                          1,
                                      0)
                                  .day,
                            ),
                          ),
                          Text("/", style: textStyle),
                          Flexible(
                            flex: 1,
                            child: listWheelScrollView(
                              initial: addUpdateTaskController.getMonth(),
                              list: ListMonthsDays.months,
                              type: "month",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget listWheelScrollView(
      {@required List list,
      @required String type,
      int length,
      @required String initial}) {
    return CupertinoPicker(
      scrollController: FixedExtentScrollController(
        initialItem: (type == "day" || type == "month") == true
            ? int.parse(initial) - 1
            : int.parse(initial),
      ),
      looping: true,
      itemExtent: 45,
      onSelectedItemChanged: (value) {
        if (type == "hour") addUpdateTaskController.setHour(value);
        if (type == "minutes") addUpdateTaskController.setMinutes(value);
        if (type == "day") addUpdateTaskController.setDay(value);
        if (type == "month") addUpdateTaskController.setMonth(value);
      },
      children: List.generate(
        length ?? list.length,
        (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(),
            child: Center(
                child: Text(
              "${list[index]}",
              style: TextStyle(fontSize: 25),
            )),
          );
        },
      ),
    );
  }
}
