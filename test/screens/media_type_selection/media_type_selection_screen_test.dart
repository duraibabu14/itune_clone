import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ituneclone/common/custom_app_bar.dart';
import 'package:ituneclone/screens/media_type_selection/media_type_selection_screen.dart';
import 'package:ituneclone/screens/media_type_selection/media_type_selection_screen_view_model.dart';
import 'package:ituneclone/utils/enum.dart';

void main() {
  late ProviderContainer container;
  late MediaTypeSelectionScreenViewModel mockViewModel;

  setUp(() {
    mockViewModel = MediaTypeSelectionScreenViewModel();
    container = ProviderContainer(overrides: [
      mediaTypeSelectionScreenViewModelProvider
          .overrideWith((ref) => mockViewModel),
    ]);
  });

  tearDown(() {
    container.dispose();
  });

  testWidgets('initial state of MediaTypeSelectionScreen',
      (WidgetTester tester) async {
    final args = MediaSelectionScreenArgs(
      mediaTypes: [MediaTypes.music, MediaTypes.movie],
    );

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: MediaTypeSelectionScreen(args: args),
        ),
      ),
    );

    // Check that the media types are listed
    expect(find.text('Music'), findsOneWidget);
    expect(find.text('Movies'), findsOneWidget);
  });

  testWidgets('selecting a media type', (WidgetTester tester) async {
    final args = MediaSelectionScreenArgs(
      mediaTypes: [MediaTypes.music],
    );

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: MediaTypeSelectionScreen(args: args),
        ),
      ),
    );

    // Verify that the initial state has the music media type selected
    expect(find.byIcon(Icons.check), findsOneWidget);

    // Tap on 'Movie' to select it
    await tester.tap(find.text('Movies'));
    await tester.pump();

    // Verify that the 'Movie' media type is now selected
    expect(find.byIcon(Icons.check), findsNWidgets(2));
  });

  testWidgets('popping the screen', (WidgetTester tester) async {
    final args = MediaSelectionScreenArgs(
      mediaTypes: [MediaTypes.music],
    );

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: MediaTypeSelectionScreen(args: args),
        ),
      ),
    );

    // Tap on the back button
    await tester.tap(find.byType(CustomAppBar));
    await tester.pump();

  });
}
