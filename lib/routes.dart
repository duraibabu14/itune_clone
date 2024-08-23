import 'package:flutter/material.dart';
import 'package:ituneclone/screens/home/home_screen.dart';
import 'package:ituneclone/screens/home/home_screen_viewmodel.dart';
import 'package:ituneclone/screens/landing/landing_screen.dart';
import 'package:ituneclone/screens/media_detail/media_detail_screen.dart';
import 'package:ituneclone/screens/media_detail/media_detail_screen_viewmodel.dart';
import 'package:ituneclone/screens/media_type_selection/media_type_selection_screen.dart';
import 'package:ituneclone/screens/media_type_selection/media_type_selection_screen_view_model.dart';
import 'package:ituneclone/screens/no_internet/no_internet_screen.dart';

class AppRoutes {
  static const String homeScreen = "HomeScreen";
  static const String landingScreen = "LandingScreen";
  static const String mediaTypeSelectionScreen = "MediaTypeSelectionScreen";
  static const String mediaDetailScreen = "MediaDetailScreen";
  static const String noInternetConnectionScreen = "NoInternetConnectionScreen";
}

Route<dynamic> getRoute(RouteSettings settings) {
  return switch (settings.name) {
    AppRoutes.landingScreen => PageViewBuilder._buildLandingScreen(settings),
    AppRoutes.homeScreen => PageViewBuilder._buildHomeScreen(settings),
    AppRoutes.mediaTypeSelectionScreen =>
      PageViewBuilder._buildMediaTypeSelectionScreen(settings),
    AppRoutes.mediaDetailScreen =>
      PageViewBuilder._buildMediaDetailScreen(settings),
    AppRoutes.noInternetConnectionScreen =>
      PageViewBuilder._buildNoInternetScreen(settings),
    _ => PageViewBuilder._buildLandingScreen(settings)
  };
}

class PageViewBuilder {
  static MaterialPageRoute _buildLandingScreen(RouteSettings settings) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: AppRoutes.landingScreen),
        builder: (context) => const LandingScreen());
  }

  static MaterialPageRoute _buildHomeScreen(RouteSettings settings) {
    final args = settings.arguments as HomeScreenArgs;
    return MaterialPageRoute(
      settings: const RouteSettings(name: AppRoutes.homeScreen),
      builder: (context) => HomeScreen(
        args: args,
      ),
    );
  }

  static MaterialPageRoute _buildMediaTypeSelectionScreen(
      RouteSettings settings) {
    final args = settings.arguments as MediaSelectionScreenArgs;
    return MaterialPageRoute(
      settings: const RouteSettings(name: AppRoutes.mediaTypeSelectionScreen),
      builder: (context) => MediaTypeSelectionScreen(
        args: args,
      ),
    );
  }

  static MaterialPageRoute _buildMediaDetailScreen(RouteSettings settings) {
    final args = settings.arguments as MediaDetailScreenArgs;
    return MaterialPageRoute(
      settings: const RouteSettings(name: AppRoutes.mediaDetailScreen),
      builder: (context) => MediaDetailScreen(
        args: args,
      ),
    );
  }

  static MaterialPageRoute _buildNoInternetScreen(RouteSettings settings) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: AppRoutes.noInternetConnectionScreen),
      builder: (context) => const NoInternetScreen(),
    );
  }
}
