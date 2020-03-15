import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:todolist/app/modules/add_task/add_task_page.dart';

main() {
  testWidgets('AddTaskPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(AddTaskPage(title: 'AddTask')));
    final titleFinder = find.text('AddTask');
    expect(titleFinder, findsOneWidget);
  });
}
