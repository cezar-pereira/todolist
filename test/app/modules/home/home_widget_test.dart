import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:todolist/app/modules/home/home_widget.dart';

main() {
  testWidgets('HomeWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(HomeWidget()));
    final textFinder = find.text('Home');
    expect(textFinder, findsOneWidget);
  });
}
