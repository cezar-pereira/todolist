import 'dart:convert';

class Task {
    final String title;
    final String hour;
    final String date;
    final String category;
    final int importance;
    final String description;
    final bool done;

    Task({
        this.title,
        this.hour,
        this.date,
        this.category,
        this.importance,
        this.description,
        this.done = false,
    });

    Task copyWith({
        String title,
        String hour,
        String date,
        String category,
        int importance,
        String description,
        bool done,
    }) => 
        Task(
            title: title ?? this.title,
            hour: hour ?? this.hour,
            date: date ?? this.date,
            category: category ?? this.category,
            importance: importance ?? this.importance,
            description: description ?? this.description,
            done: done ?? this.done,
        );

    factory Task.fromJson(String str) => Task.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Task.fromMap(Map<String, dynamic> json) => Task(
        title: json["title"],
        hour: json["hour"],
        date: json["date"],
        category: json["category"],
        importance: json["importance"],
        description: json["description"],
        done: json["done"],
    );

    Map<String, dynamic> toMap() => {
        "title": title,
        "hour": hour,
        "date": date,
        "category": category,
        "importance": importance,
        "description": description,
        "done": done,
    };
}