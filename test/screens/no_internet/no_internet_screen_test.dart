import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ituneclone/common/custom_text.dart';
import 'package:ituneclone/screens/no_internet/no_internet_screen.dart';
import 'package:ituneclone/utils/color_resource.dart';
import 'package:ituneclone/utils/string_resource.dart';

void main() {
  testWidgets('NoInternetScreen displays correct content',
      (WidgetTester tester) async {
    // Build the NoInternetScreen widget
    await tester.pumpWidget(const MaterialApp(home: NoInternetScreen()));

    // Verify that the CustomText widget is displayed with correct text
    expect(find.byType(CustomText), findsOneWidget);
    expect(find.text(StringResource.noInternet), findsOneWidget);

    // Verify the color and font size of CustomText
    final customTextFinder = find.text(StringResource.noInternet);
    final customTextWidget = tester.widget<Text>(customTextFinder);
    expect(customTextWidget.style?.color, equals(ColorResource.colorFFFFFF));
    expect(customTextWidget.style?.fontSize, equals(16));
    expect(customTextWidget.style?.fontWeight, equals(FontWeight.w700));
  });
}
