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
  String period = "Hoje";

  @observable
  List<Category> categories;

  @action
  setPeriod(String period) {
    this.period = period;
  }

  @action
  getCategories() {
    categories = categoriesRepository.getCategories();
  }
}
