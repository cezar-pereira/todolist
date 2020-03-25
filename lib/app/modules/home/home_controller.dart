import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {

  @observable
  String _period = "Hoje";

  @action
  setPeriod(String value) => this._period = value;

  String get getPeriod => this._period;
}
