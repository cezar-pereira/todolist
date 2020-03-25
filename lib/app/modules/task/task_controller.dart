import 'package:mobx/mobx.dart';
import 'package:todolist/app/shared/models/task.dart';

part 'task_controller.g.dart';

class TaskController = _TaskBase with _$TaskController;

abstract class _TaskBase with Store {
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
  int _importanceSelected = 2;
  @observable
  String _description = "";

  @observable
  String _messageError = "";

  @action
  setTitle(String value) => this._title = value;

  @action
  setHour(int value) {
    if (value < 10)
      this._hour = "0" + value.toString();
    else
      this._hour = value.toString();
  }

  @action
  setMinutes(int value) {
    if (value < 10)
      this._minutes = "0" + value.toString();
    else
      this._minutes = value.toString();
  }

  @action
  setDay(int value) => this._day = (value + 1).toString();
  @action
  setMonth(int value) {
    if (value < 10)
      this._month = "0" + (value + 1).toString();
    else
      this._month = (value + 1).toString();
  }

  @action
  setCategory(String value) => this._category = value;
  @action
  setImportance(int value) => this._importanceSelected = value;
  @action
  setDescription(String value) => this._description = value;

  String get getTitle => this._title;
  getImportanceSelected() => this._importanceSelected;
  getCategorySelected() => this._category;

  getHour() => this._hour;
  getMinutes() => this._minutes;
  getDay() => this._day;
  getMonth() => this._month;

  @action
  setMessageError(String value) => this._messageError = value;
  String get getMessageError => this._messageError;

  @action
  fillTask(Task task) {
    this._title = task.title;
    this._hour = task.hour;
    this._minutes = task.minutes;
    this._day = task.day;
    this._month = task.month;
    this._category = task.category;
    this._categoryId = task.categoryId;
    this._importanceSelected = task.importance;
    this._description = task.description;
  }

  @action
  cleanPage() {
    this._title = "";
    this.setHour(0);
    this.setMinutes(0);
    this._day = (DateTime.now().day).toString();
    this._month = (DateTime.now().month).toString();
    this.setImportance(2);
    this._description = "";
    this._messageError = "";
  }

  @action
  save() {
    Task task = Task(
        hour: this._hour,
        minutes: this._minutes,
        day: this._day,
        month: this._month,
        category: getCategorySelected(),
        categoryId: this._categoryId,
        importance: getImportanceSelected(),
        description: this._description,
        title: this._title);
    print("Título: ${task.title}");
    print("Hora: ${task.hour}");
    print("Minutos: ${task.minutes}");
    print("Dia: ${task.day}");
    print("Mês: ${task.month}");
    print("Categoria: ${task.category}");
    print("Importancia: ${task.importance}");
    print("Descrição: ${task.description}");
  }
}
