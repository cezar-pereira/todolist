import 'package:mobx/mobx.dart';

part 'task_list_controller.g.dart';

class TaskListController = _TaskListBase with _$TaskListController;

abstract class _TaskListBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
