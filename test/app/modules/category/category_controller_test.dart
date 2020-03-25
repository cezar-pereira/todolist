import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:todolist/app/modules/category/category_controller.dart';
import 'package:todolist/app/app_module.dart';

void main() {
  initModule(AppModule());
  CategoryController category;

  setUp(() {
    category = AppModule.to.get<CategoryController>();
  });

  group('CategoryController Test', () {
    test("First Test", () {
      expect(category, isInstanceOf<CategoryController>());
    });

    test("Set Value", () {
      expect(category.value, equals(0));
      category.increment();
      expect(category.value, equals(1));
    });
  });
}
