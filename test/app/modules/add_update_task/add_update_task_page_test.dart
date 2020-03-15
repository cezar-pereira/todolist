import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:todolist/app/modules/add_update_task/add_update_task_page.dart';

main() {
  testWidgets('AddUpdateTaskPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(
        buildTestableWidget(AddUpdateTaskPage(title: 'AddUpdateTask')));
    final titleFinder = find.text('AddUpdateTask');
    expect(titleFinder, findsOneWidget);
  });
}
