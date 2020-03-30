import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  @observable
  bool _editDeleteIsVisible = false;

  @observable
  int _indexCategorySelectedForEditDelete;

  @observable
  String _period = "Hoje";

  @action
  setPeriod(String value) => this._period = value;
  String get getPeriod => this._period;
  @action
  setEditDeleteIsVisible(bool value) => this._editDeleteIsVisible = value;
  bool get getEditDeleteIsVisible => this._editDeleteIsVisible;
  @action
  setIndexCategorySelectedForEditDelete(int value) => this._indexCategorySelectedForEditDelete = value;
  int get getIndexCategorySelectedForEditDelete => this._indexCategorySelectedForEditDelete;
}
