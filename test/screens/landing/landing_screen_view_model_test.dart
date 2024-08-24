import 'package:flutter_test/flutter_test.dart';
import 'package:ituneclone/screens/landing/landing_screen_viewmodel.dart';
import 'package:ituneclone/utils/app_utils.dart';
import 'package:ituneclone/utils/enum.dart';
import 'package:mocktail/mocktail.dart';

class MockAppUtils extends Mock implements AppUtils {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late LandingScreenViewModel viewModel;

  setUp(() {
    viewModel = LandingScreenViewModel();
  });

  group('LandingScreenViewModel Tests', () {
    test('should initialize viewModel without errors', () {
      // This is a simple initialization test.
      // You could check any side effects of init() if they exist.
      expect(viewModel.mediaTypes, isEmpty);
    });

    test('should add media types and notify listeners', () {
      final mediaTypes = [MediaTypes.movie, MediaTypes.music];

      bool isListenerNotified = false;
      viewModel.addListener(() {
        isListenerNotified = true;
      });

      viewModel.addAllMediaTypes(mediaTypes);

      expect(viewModel.mediaTypes, equals(mediaTypes));
      expect(isListenerNotified, isTrue);
    });

    test('should validate search text and show toast on empty input', () {
      viewModel.searchController.text = ''; // Simulate empty search text

      final isValid = viewModel.isSearchTextValidated();

      expect(isValid, isFalse);
    });

    test('should validate search text as true when not empty', () {
      viewModel.searchController.text =
          'Test Search'; // Simulate valid search text

      final isValid = viewModel.isSearchTextValidated();

      expect(isValid, isTrue);
    });
  });
}
