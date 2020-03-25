import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:todolist/app/modules/category/category_widget.dart';

main() {
  testWidgets('CategoryWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(CategoryWidget()));
    final textFinder = find.text('Category');
    expect(textFinder, findsOneWidget);
  });
}
