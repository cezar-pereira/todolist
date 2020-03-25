import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:todolist/app/modules/task/task_controller.dart';
import 'package:todolist/app/app_module.dart';

void main() {
  initModule(AppModule());
  TaskController task;

  setUp(() {
    task = AppModule.to.get<TaskController>();
  });

  group('TaskController Test', () {
    test("First Test", () {
      expect(task, isInstanceOf<TaskController>());
    });

    test("Set Value", () {
      expect(task.value, equals(0));
      task.increment();
      expect(task.value, equals(1));
    });
  });
}
