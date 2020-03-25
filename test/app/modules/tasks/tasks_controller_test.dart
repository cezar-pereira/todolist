import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:todolist/app/modules/tasks/tasks_controller.dart';
import 'package:todolist/app/app_module.dart';

void main() {
  initModule(AppModule());
  TasksController tasks;

  setUp(() {
    tasks = AppModule.to.get<TasksController>();
  });

  group('TasksController Test', () {
    test("First Test", () {
      expect(tasks, isInstanceOf<TasksController>());
    });

    test("Set Value", () {
      expect(tasks.value, equals(0));
      tasks.increment();
      expect(tasks.value, equals(1));
    });
  });
}
