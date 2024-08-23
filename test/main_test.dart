import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ituneclone/my_app.dart';

void main() {
  testWidgets('App launches with ProviderScope', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    // Verify that MyApp is rendered.
    expect(find.byType(MyApp), findsOneWidget);
  });
}
