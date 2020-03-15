import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:todolist/app/modules/add_task/add_task_controller.dart';
import 'package:todolist/app/modules/add_task/add_task_module.dart';

void main() {
  initModule(AddTaskModule());
  AddTaskController addtask;

  setUp(() {
    addtask = AddTaskModule.to.get<AddTaskController>();
  });

  group('AddTaskController Test', () {
    test("First Test", () {
      expect(addtask, isInstanceOf<AddTaskController>());
    });

    test("Set Value", () {
      expect(addtask.value, equals(0));
      addtask.increment();
      expect(addtask.value, equals(1));
    });
  });
}
