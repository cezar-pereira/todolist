import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:todolist/app/modules/add_update_task/add_update_task_controller.dart';
import 'package:todolist/app/modules/add_update_task/add_update_task_module.dart';

void main() {
  initModule(AddUpdateTaskModule());
  AddUpdateTaskController addupdatetask;

  setUp(() {
    addupdatetask = AddUpdateTaskModule.to.get<AddUpdateTaskController>();
  });

  group('AddUpdateTaskController Test', () {
    test("First Test", () {
      expect(addupdatetask, isInstanceOf<AddUpdateTaskController>());
    });

    test("Set Value", () {
      expect(addupdatetask.value, equals(0));
      addupdatetask.increment();
      expect(addupdatetask.value, equals(1));
    });
  });
}
