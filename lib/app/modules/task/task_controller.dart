import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todolist/app/modules/category/category_controller.dart';
import 'package:todolist/app/shared/models/category.dart';
import 'package:todolist/app/shared/models/task.dart';
import 'package:todolist/app/shared/repositories/tasks_hasura_repository.dart';

part 'task_controller.g.dart';

class TaskController = _TaskBase with _$TaskController;

abstract class _TaskBase with Store {
  final TasksHasuraRepository _tasksHasuraRepository;
  _TaskBase(this._tasksHasuraRepository);

  @observable
  String _id = "";
  @observable
  String _title = "";
  @observable
  String _hour = "00";
  @observable
  String _minutes = "00";
  @observable
  String _day = "0";
  @observable
  String _month = "0";
  @observable
  String _category;
  @observable
  String _categoryId;
  @observable
  int _importance = 2;
  @observable
  String _description = "";
  @observable
  bool _done;
  @observable
  String _messageError = "";

  @action
  setTitle(String value) => this._title = value;
  String get getTitle => this._title;

  @action
  setHour(int value) {
    if (value < 10)
      this._hour = "0" + value.toString();
    else
      this._hour = value.toString();
  }

  getHour() => this._hour;

  @action
  setMinutes(int value) {
    if (value < 10)
      this._minutes = "0" + value.toString();
    else
      this._minutes = value.toString();
  }

  getMinutes() => this._minutes;

  @action
  setDay(int value) {
    if (value < 10)
      this._day = "0" + (value + 1).toString();
    else
      this._day = (value + 1).toString();
  }

  getDay() => this._day;

  @action
  setMonth(int value) {
    if (value < 10)
      this._month = "0" + (value + 1).toString();
    else
      this._month = (value + 1).toString();
  }

  getMonth() => this._month;

  @action
  setCategory(String value) => this._category = value;
  String get getCategory => this._category;

  @action
  setCategoryId(String value) {
    var iterable = Modular.get<CategoryController>().categories.value;
    for (var category in iterable) {
      if (category.name == value) {
        this._categoryId = category.id;
      }
    }
  }

  String get getCategoryId => this._category;

  @action
  setImportance(int value) => this._importance = value;
  int get getImportance => this._importance;

  @action
  setDescription(String value) => this._description = value;
  String get getDescription => this._description;

  @action
  setMessageError(String value) => this._messageError = value;
  String get getMessageError => this._messageError;

  @action
  fillTask(var categoryOrTask) {
    if (categoryOrTask.runtimeType == Category
      ..runtimeType) {
      this.cleanPage();
      this.setCategory(categoryOrTask.name);
      this._categoryId = categoryOrTask.id;
    } else if (categoryOrTask.runtimeType == Task
      ..runtimeType) {
      this.cleanPage();
      this._id = categoryOrTask.id;
      this._title = categoryOrTask.title;
      this.setHour(int.parse(categoryOrTask.hour));
      this.setMinutes(int.parse(categoryOrTask.minutes));
      this.setDay(int.parse(categoryOrTask.day) - 1);
      this.setMonth(int.parse(categoryOrTask.month) - 1);
      this._category = categoryOrTask.category;
      this._categoryId = categoryOrTask.categoryId;
      this._importance = categoryOrTask.importance;
      this._description = categoryOrTask.description;
      this._categoryId = categoryOrTask.categoryId;
      this._done = categoryOrTask.done;
    }
  }

  @action
  cleanPage() {
    this._title = "";
    this.setHour(0);
    this.setMinutes(0);
    this.setDay(DateTime.now().day - 1);
    this.setMonth(DateTime.now().month - 1);
    this.setImportance(2);
    this._description = "";
    this._messageError = "";
    this._categoryId = "";
  }

  @action
  schedulingIsValid() {
    var dateNow = DateTime.now();

    var chosenDate = DateTime(
      DateTime.now().year,
      int.parse(this._month),
      int.parse(this._day),
      int.parse(this._hour),
      int.parse(this._minutes),
      DateTime.now().second,
    );

    return dateNow.isBefore(chosenDate);
  }

  @action
  Future<bool> save(var categoryOrTask) async {
    Task task = Task(
      id: this._id,
      hour: this._hour,
      minutes: this._minutes,
      day: this._day,
      month: this._month,
      category: getCategory,
      categoryId: this._categoryId,
      importance: getImportance,
      description: this._description,
      title: this._title,
      done: this._done,
    );

    bool result;

    if (categoryOrTask.runtimeType == Category
      ..runtimeType) {
      result = await _tasksHasuraRepository.addTask(task);
    } else if (categoryOrTask.runtimeType == Task
      ..runtimeType) {
      result = await _tasksHasuraRepository.updateTask(task);
    }
    return result;
  }

  @action
  Future<bool> deleteTask({@required Task task}) async {
    return await this._tasksHasuraRepository.deleteTask(task);
  }
}
