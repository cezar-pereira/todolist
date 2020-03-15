import 'dart:convert';

class Task {
  final String id;
  final String title;
  final String hour;
  final String minute;
  final String day;
  final String month;
  final String category;
  final int importance;
  final String description;
  final bool done;

  Task({
    this.id,
    this.title,
    this.hour,
    this.minute,
    this.day,
    this.month,
    this.category,
    this.importance,
    this.description,
    this.done = false,
  });

  Task copyWith({
    String id,
    String title,
    String hour,
    String minute,
    String day,
    String month,
    String category,
    String importance,
    String description,
    bool done,
  }) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        hour: hour ?? this.hour,
        minute: minute ?? this.minute,
        day: day ?? this.day,
        month: month ?? this.month,
        category: category ?? this.category,
        importance: importance ?? this.importance,
        description: description ?? this.description,
        done: done ?? this.done,
      );

  factory Task.fromJson(String str) => Task.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Task.fromMap(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        hour: json["hour"],
        minute: json["minute"],
        day: json["day"],
        month: json["month"],
        category: json["category"],
        importance: json["importance"],
        description: json["description"],
        done: json["done"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "hour": hour,
        "minute": minute,
        "day": day,
        "month": month,
        "category": category,
        "importance": importance,
        "description": description,
        "done": done,
      };
}
