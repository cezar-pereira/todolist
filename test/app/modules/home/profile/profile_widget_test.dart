import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:todolist/app/modules/home/profile/profile_widget.dart';

main() {
  testWidgets('ProfileWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ProfileWidget()));
    final textFinder = find.text('Profile');
    expect(textFinder, findsOneWidget);
  });
}
