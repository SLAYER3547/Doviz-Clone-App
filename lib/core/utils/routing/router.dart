import 'package:doviz_clone_app/ui/views/app_view.dart';
import 'package:doviz_clone_app/ui/views/menu_view/menu_view.dart';
import 'package:doviz_clone_app/ui/views/screens/converter_view/converter_view.dart';
import 'package:doviz_clone_app/ui/views/screens/home_views/home.dart';
import 'package:doviz_clone_app/ui/views/screens/markets_view/markets_view.dart';
import 'package:doviz_clone_app/ui/views/screens/news_view/news.view.dart';
import 'package:doviz_clone_app/ui/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rooterKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();
  static const String home = '/';
  static const String news = '/news';
  static const String markets = '/markets';
  static const String converter = '/converter';
  static const String menu = '/menu';
}

final router = GoRouter(
  navigatorKey: _rooterKey,
  initialLocation: '/splash', // İlk olarak SplashScreen açılacak
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => AppView(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.news,
              builder: (context, state) => const NewsView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.markets,
              builder: (context, state) => const MarketsView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.converter,
              builder: (context, state) => const CurrencyConverterPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.menu,
              builder: (context, state) => const MenuView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
