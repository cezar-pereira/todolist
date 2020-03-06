import 'package:mobx/mobx.dart';
import 'package:todolist/app/modules/home/home_repository.dart';
import 'package:todolist/app/shared/models/category.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  HomeRepository homeRepository;

  _HomeBase(this.homeRepository) {
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
    categories = homeRepository.getCategories();
  }
}
