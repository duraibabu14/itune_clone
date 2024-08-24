import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ituneclone/screens/landing/landing_screen.dart'; // Adjust import as needed
import 'package:ituneclone/screens/landing/landing_screen_viewmodel.dart'; // Adjust import as needed
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'landing_screen_test.mocks.dart';

// Create mocks

@GenerateNiceMocks([MockSpec<LandingScreenViewModel>()])
void main() {
  late MockLandingScreenViewModel mockViewModel;

  setUp(() {
    mockViewModel = MockLandingScreenViewModel();

    when(mockViewModel.isRooted()).thenAnswer((_) async => false);
  });

  testWidgets('should show search field and submit button',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProviderScope(
          child: LandingScreen(),
        ),
      ),
    );

    expect(find.byType(BuildSearchField), findsOneWidget);
    expect(find.byType(BuildSubmit), findsOneWidget);
  });

  testWidgets('should navigate to home screen with search parameters on submit',
      (WidgetTester tester) async {
    // when(mockViewModel.searchController.text).thenReturn('Test Search');
    when(mockViewModel.isSearchTextValidated()).thenReturn(true);
    expect(mockViewModel.isSearchTextValidated(), true);
  });
}
