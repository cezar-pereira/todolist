import 'package:mobx/mobx.dart';
import 'package:todolist/app/modules/add_update_task/list_months_days.dart';
import 'package:todolist/app/shared/models/category.dart';
import 'package:todolist/app/shared/models/task.dart';
import 'package:todolist/app/shared/repositories/categories_repository.dart';

part 'add_update_task_controller.g.dart';

class AddUpdateTaskController = _AddUpdateTaskBase
    with _$AddUpdateTaskController;

abstract class _AddUpdateTaskBase with Store {
  CategoriesRepository categoriesRepository;
  _AddUpdateTaskBase(this.categoriesRepository) {
    getCategories();
  }

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
  String _categorySelected;
  @observable
  int _importanceSelected = 2;
  @observable
  String _description = "";
  @observable
  List<Category> categories;

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
  setCategory(String value) => this._categorySelected = value;
  @action
  setImportance(int value) => this._importanceSelected = value;
  @action
  setDescription(String value) => this._description = value;

  getTitle() => this._title;
  getCategories() => categories = categoriesRepository.getCategories();
  getImportanceSelected() => this._importanceSelected;
  getCategorySelected() => this._categorySelected;

  getHour() => this._hour;
  getMinutes() => this._minutes;
  getDay() => this._day;
  getMonth() => this._month;

  @action
  fillTask(Task task) {
    this._title = task.title;
    this._hour = task.hour;
    this._minutes = task.minute;
    this._day = task.day;
    this._month = task.month;
    this._categorySelected = task.category;
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
  }

  @action
  save() {
    Task task = Task(
        hour: this._hour,
        minute: this._minutes,
        day: this._day,
        month: this._month,
        category: getCategorySelected(),
        importance: getImportanceSelected(),
        description: this._description,
        title: this._title);
    print("Título: ${task.title}");
    print("Hora: ${task.hour}");
    print("Minutos: ${task.minute}");
    print("Dia: ${task.day}");
    print("Mês: ${task.month}");
    print("Categoria: ${task.category}");
    print("Importancia: ${task.importance}");
    print("Descrição: ${task.description}");
  }
}
