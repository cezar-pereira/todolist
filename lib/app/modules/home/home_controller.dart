import 'package:mobx/mobx.dart';
import 'package:todolist/app/shared/models/category.dart';
import 'package:todolist/app/shared/repositories/categories_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  CategoriesRepository categoriesRepository;

  _HomeBase(this.categoriesRepository) {
    getCategories();
  }

  @observable
  int _iconSelected = 59389;

  @observable
  String _period = "Hoje";
  @observable
  String _nameCategory = "";

  @observable
  List<Category> categories;

  @action
  setPeriod(String value) => this._period = value;

  String get getPeriod => this._period;


  @action
  setNameCategory(String value) => this._nameCategory = value;

  String get getNameCategory => this._nameCategory;

  @action
  setIconSelected(int value) => this._iconSelected = value;

  int get getIconSelected => this._iconSelected;

  @action
  getCategories() {
    categories = categoriesRepository.getCategories();
  }

  @action
  save() {
    print(getNameCategory);
    print(getIconSelected);
  }
}
