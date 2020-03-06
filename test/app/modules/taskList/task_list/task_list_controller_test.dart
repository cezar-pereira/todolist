import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:todolist/app/modules/taskList/task_list/task_list_controller.dart';
import 'package:todolist/app/app_module.dart';

void main() {
  initModule(AppModule());
  TaskListController tasklist;

  setUp(() {
    tasklist = AppModule.to.get<TaskListController>();
  });

  group('TaskListController Test', () {
    test("First Test", () {
      expect(tasklist, isInstanceOf<TaskListController>());
    });

    test("Set Value", () {
      expect(tasklist.value, equals(0));
      tasklist.increment();
      expect(tasklist.value, equals(1));
    });
  });
}
