import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import '../../presentation/pages_export.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      _normalRoute(path: Routes.SPLASH, child: const SplashPage()),
      _normalRoute(path: Routes.MAIN, child: const MainPage()),
      _normalRoute(path: Routes.FIRST, child: const FirstPage()),
    ],
  );

  static GoRoute _normalRoute({
    required String path,
    required Widget child,
  }) {
    return GoRoute(
      path: path,
      builder: (c, s) => child,
    );
  }

  static GoRoute _swipeableRoute({
    required String path,
    required Widget child,
  }) {
    return GoRoute(
      path: path,
      pageBuilder: (context, state) => SwipeablePage(
        builder: (context) {
          context.getSwipeablePageRoute<void>()!
            ..canOnlySwipeFromEdge = true
            ..backGestureDetectionWidth = 100;
          return child;
        },
      ),
    );
  }
}
