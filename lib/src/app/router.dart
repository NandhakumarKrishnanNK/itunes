import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../view/splash_screen.dart';

final _homeShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');

class AppRoutes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get context => navigatorKey.currentContext!;
  // All named route paths. So that we can access them easily across the app
  static const String root = '/';
  static const String homeScreen = '/home';
  static const String loginScreen = '/login';
  static const String dashboardAnalytics = '/dashboard';

  /// private static methods that are accessible for only within the class not outside.
  static Widget _splashRouteBuilder(
          BuildContext context, GoRouterState state) =>
      SplashScreen();
  static Widget _loginRouteBuilder(BuildContext context, GoRouterState state) =>
      Container();

  /// use this in [MaterialApp.router]
  static final _router = GoRouter(
    initialLocation: root,
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
          path: AppRoutes.root,
          name: AppRoutes.root,
          builder: _splashRouteBuilder),
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: _loginRouteBuilder,
      ),

      // GoRoute(
      //   path: AppRoutes.indent,
      //   name: AppRoutes.indent,
      //   builder: _indentRouteBuilder,
      // ),
    ],
    // errorBuilder: errorWidget,
  );
  static GoRouter get router => _router;
}
