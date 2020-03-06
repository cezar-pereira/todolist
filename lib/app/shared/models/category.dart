// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

import 'package:todolist/app/shared/models/task.dart';

class Category {
    final String name;
    final int codePointIcon;
    final List<Task> tasks;

    Category({
        this.name,
        this.codePointIcon,
        this.tasks,
    });

    Category copyWith({
        String name,
        int codePointIcon,
        List<Task> tasks,
    }) => 
        Category(
            name: name ?? this.name,
            codePointIcon: codePointIcon ?? this.codePointIcon,
            tasks: tasks ?? this.tasks,
        );

    factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Category.fromMap(Map<String, dynamic> json) => Category(
        name: json["name"],
        codePointIcon: json["codePointIcon"],
        tasks: List<Task>.from(json["tasks"].map((x) => Task.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "codePointIcon": codePointIcon,
        "tasks": List<dynamic>.from(tasks.map((x) => x.toMap())),
    };

    static List<Category> fromJsonList(List list){
      if(list == null) return null;
      return list.map<Category>((item) => Category.fromMap(item)).toList();
    }
}


