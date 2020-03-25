import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:todolist/app/modules/task/task_widget.dart';

main() {
  testWidgets('TaskWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(TaskWidget()));
    final textFinder = find.text('Task');
    expect(textFinder, findsOneWidget);
  });
}
