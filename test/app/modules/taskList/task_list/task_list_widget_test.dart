import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:todolist/app/modules/taskList/task_list/task_list_widget.dart';

main() {
  testWidgets('TaskListWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(TaskListWidget(category: null,)));
    final textFinder = find.text('TaskList');
    expect(textFinder, findsOneWidget);
  });
}
