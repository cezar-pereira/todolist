import 'dart:convert';

class Task {
  final String id;
  final String title;
  final String hour;
  final String minutes;
  final String day;
  final String month;
  final String category;
  final String categoryId;
  final int importance;
  final String description;
  final bool done;

  Task({
    this.id,
    this.title,
    this.hour,
    this.minutes,
    this.day,
    this.month,
    this.category,
    this.categoryId,
    this.importance,
    this.description,
    this.done = false,
  });

  Task copyWith({
    String id,
    String title,
    String hour,
    String minutes,
    String day,
    String month,
    String category,
    String categoryId,
    int importance,
    String description,
    bool done,
  }) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        hour: hour ?? this.hour,
        minutes: minutes ?? this.minutes,
        day: day ?? this.day,
        month: month ?? this.month,
        category: category ?? this.category,
        categoryId: categoryId ?? this.categoryId,
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
        minutes: json["minutes"],
        day: json["day"],
        month: json["month"],
        category: json["category"],
        categoryId: json["category_id"],
        importance: json["importance"],
        description: json["description"],
        done: json["done"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "hour": hour,
        "minutes": minutes,
        "day": day,
        "month": month,
        "category": category,
        "category_id": categoryId,
        "importance": importance,
        "description": description,
        "done": done,
      };

  toString() {
    print("Título: ${this.title}");
    print("Hora: ${this.hour}");
    print("Minutos: ${this.minutes}");
    print("Dia: ${this.day}");
    print("Mês: ${this.month}");
    print("Categoria: ${this.category}");
    print("Categoria id: ${this.categoryId}");
    print("Importancia: ${this.importance}");
    print("Descrição: ${this.description}");
  }
}
