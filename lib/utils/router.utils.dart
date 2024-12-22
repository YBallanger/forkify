import 'package:flutter/material.dart';
import 'package:forkify/view/feature/scaffold/forkify_scaffold.feature.dart';
import 'package:forkify/view/screen/home.screen.dart';
import 'package:forkify/view/screen/map.screen.dart';
import 'package:forkify/view/screen/profile.screen.dart';
import 'package:forkify/view/screen/statistics.screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    // Screens with regular scaffold
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ForkifyScaffold(body: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return HomeScreen();
          },
        ),
        GoRoute(
          path: '/profile',
          builder: (BuildContext context, GoRouterState state) {
            return const ProfileScreen();
          },
        ),
        GoRoute(
          path: '/statistics',
          builder: (BuildContext context, GoRouterState state) {
            return const StatisticsScreen();
          },
        ),
        GoRoute(
          path: '/map',
          builder: (BuildContext context, GoRouterState state) {
            return const MapScreen();
          },
        ),
      ],
    ),
  ],
);
