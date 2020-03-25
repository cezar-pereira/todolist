import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:todolist/app/modules/add_update_category/add_update_category_controller.dart';
import 'package:todolist/app/app_module.dart';

void main() {
  initModule(AppModule());
  AddUpdateCategoryController addupdatecategory;

  setUp(() {
    addupdatecategory = AppModule.to.get<AddUpdateCategoryController>();
  });

  group('AddUpdateCategoryController Test', () {
    test("First Test", () {
      expect(addupdatecategory, isInstanceOf<AddUpdateCategoryController>());
    });

    test("Set Value", () {
      expect(addupdatecategory.value, equals(0));
      addupdatecategory.increment();
      expect(addupdatecategory.value, equals(1));
    });
  });
}
