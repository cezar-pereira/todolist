import 'package:mobx/mobx.dart';
import 'package:todolist/app/modules/home/home_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  HomeRepository homeRepository;

  _HomeBase(HomeRepository homeRepository) {
    this.homeRepository = homeRepository;
    getCategories();
  }
  @observable
  String period = "Hoje";

  @observable
  List categories;

  @action
  setPeriod(String period) {
    this.period = period;
  }

  @action
  getCategories() {
    categories = homeRepository.getCategories();
  }
}
