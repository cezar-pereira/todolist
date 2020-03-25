import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:todolist/app/modules/add_update_category/add_update_category_widget.dart';

main() {
  testWidgets('AddUpdateCategoryWidget has message',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(AddUpdateCategoryWidget()));
    final textFinder = find.text('AddUpdateCategory');
    expect(textFinder, findsOneWidget);
  });
}
