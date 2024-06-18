import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:itunes/src/view/detail_screen.dart';
import 'package:itunes/src/view/home_screen.dart';
import 'package:itunes/src/view/media_screen.dart';

import '../model/itunes_model.dart';
import '../providers/itunes_provider.dart';
import '../view/itunes_screen.dart';
import '../view/splash_screen.dart';

final _homeShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');

class AppRoutes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get context => navigatorKey.currentContext!;
  // All named route paths. So that we can access them easily across the app
  static const String root = '/';
  static const String homeScreen = '/home';
  static const String mediaSceen = '/media';
  static const String itunesScreen = '/itunes';
  static const String detailScreen = '/details';

  /// use this in [MaterialApp.router]
  static final _router = GoRouter(
    initialLocation: root,
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
          path: AppRoutes.root,
          name: AppRoutes.root,
          builder: (BuildContext context, GoRouterState state) =>
              const SplashScreen()),
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (BuildContext context, GoRouterState state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.mediaSceen,
        name: AppRoutes.mediaSceen,
        builder: (BuildContext context, GoRouterState state) =>
            const MediaScreen(),
      ),
      GoRoute(
          path: AppRoutes.itunesScreen,
          name: AppRoutes.itunesScreen,
          builder: (BuildContext context, GoRouterState state) {
            ITuneParameter data = state.extra as ITuneParameter;
            return ITunesScreen(term: data.term, entity: data.entity);
          }),
      GoRoute(
        path: AppRoutes.detailScreen,
        name: AppRoutes.detailScreen,
        builder: (BuildContext context, GoRouterState state) => DetailScreen(
          data: state.extra as Results,
        ),
      ),
    ],
    // errorBuilder: errorWidget,
  );
  static GoRouter get router => _router;
}
