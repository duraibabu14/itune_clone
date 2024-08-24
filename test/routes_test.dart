import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ituneclone/routes.dart';
import 'package:ituneclone/screens/home/home_screen.dart';
import 'package:ituneclone/screens/home/home_screen_viewmodel.dart';
import 'package:ituneclone/screens/landing/landing_screen.dart';
import 'package:ituneclone/screens/media_detail/media_detail_screen.dart';
import 'package:ituneclone/screens/media_detail/media_detail_screen_viewmodel.dart';
import 'package:ituneclone/screens/media_type_selection/media_type_selection_screen.dart';
import 'package:ituneclone/screens/media_type_selection/media_type_selection_screen_view_model.dart';
import 'package:ituneclone/screens/no_internet/no_internet_screen.dart';
import 'package:ituneclone/utils/enum.dart';
import 'package:mocktail/mocktail.dart';

class MyContext extends Mock implements BuildContext {}

void main() {
  group('getRoute', () {
    late BuildContext context;
    setUpAll(() {
      context = MyContext();
    });
    test('returns LandingScreen when route is landingScreen', () {
      const settings = RouteSettings(name: AppRoutes.landingScreen);
      final route = getRoute(settings);

      expect(route, isA<MaterialPageRoute>());
      expect((route as MaterialPageRoute).builder, isNotNull);

      final widget = route.builder(context);
      expect(widget, isA<LandingScreen>());
    });

    test('returns HomeScreen with correct arguments when route is homeScreen',
        () {
      final homeArgs = HomeScreenArgs(
          searchText: "jo",
          mediaTypes: [MediaTypes.movie]); // Use your actual HomeScreenArgs
      final settings = RouteSettings(
        name: AppRoutes.homeScreen,
        arguments: homeArgs,
      );
      final route = getRoute(settings);

      expect(route, isA<MaterialPageRoute>());
      expect((route as MaterialPageRoute).builder, isNotNull);

      final widget = route.builder(context);
      expect(widget, isA<HomeScreen>());

      final homeScreen = widget as HomeScreen;
      expect(homeScreen.args, homeArgs);
    });

    test(
        'returns MediaTypeSelectionScreen with correct arguments when route is mediaTypeSelectionScreen',
        () {
      final selectionArgs = MediaSelectionScreenArgs(
        mediaTypes: [MediaTypes.movie],
      ); // Use your actual MediaSelectionScreenArgs
      final settings = RouteSettings(
        name: AppRoutes.mediaTypeSelectionScreen,
        arguments: selectionArgs,
      );
      final route = getRoute(settings);

      expect(route, isA<MaterialPageRoute>());
      expect((route as MaterialPageRoute).builder, isNotNull);

      final widget = route.builder(context);
      expect(widget, isA<MediaTypeSelectionScreen>());

      final mediaScreen = widget as MediaTypeSelectionScreen;
      expect(mediaScreen.args, selectionArgs);
    });

    test(
        'returns MediaDetailScreen with correct arguments when route is mediaDetailScreen',
        () {
      final detailArgs =
          MediaDetailScreenArgs(id: 1); // Use your actual MediaDetailScreenArgs
      final settings = RouteSettings(
        name: AppRoutes.mediaDetailScreen,
        arguments: detailArgs,
      );
      final route = getRoute(settings);

      expect(route, isA<MaterialPageRoute>());
      expect((route as MaterialPageRoute).builder, isNotNull);

      final widget = route.builder(context);
      expect(widget, isA<MediaDetailScreen>());

      final detailScreen = widget as MediaDetailScreen;
      expect(detailScreen.args, detailArgs);
    });

    test('returns NoInternetScreen when route is noInternetConnectionScreen',
        () {
      const settings =
          RouteSettings(name: AppRoutes.noInternetConnectionScreen);
      final route = getRoute(settings);

      expect(route, isA<MaterialPageRoute>());
      expect((route as MaterialPageRoute).builder, isNotNull);

      final widget = route.builder(context);
      expect(widget, isA<NoInternetScreen>());
    });

    test('returns default LandingScreen for unknown route', () {
      const settings = RouteSettings(name: 'unknownRoute');
      final route = getRoute(settings);

      expect(route, isA<MaterialPageRoute>());
      expect((route as MaterialPageRoute).builder, isNotNull);

      final widget = route.builder(context);
      expect(widget, isA<LandingScreen>());
    });
  });
}
