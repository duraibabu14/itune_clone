import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ituneclone/my_app.dart';
import 'package:ituneclone/routes.dart';

void main() {
  testWidgets('MyApp initializes with correct properties',
      (WidgetTester tester) async {
    // Build the MyApp widget.
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // Verify that the MaterialApp is rendered.
    final materialAppFinder = find.byType(MaterialApp);
    expect(materialAppFinder, findsOneWidget);

    // Extract the MaterialApp widget from the widget tree.
    final MaterialApp materialAppWidget =
        tester.widget<MaterialApp>(materialAppFinder);

    // Check that debugShowCheckedModeBanner is set to false.
    expect(materialAppWidget.debugShowCheckedModeBanner, false);

    // Verify that the initialRoute is set correctly.
    expect(materialAppWidget.initialRoute, AppRoutes.landingScreen);

    // Verify that the onGenerateRoute is set correctly.
    expect(materialAppWidget.onGenerateRoute, getRoute);
  });
}
