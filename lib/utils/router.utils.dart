import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forkify/view/feature/scaffold/forkify_scaffold.feature.dart';
import 'package:forkify/view/feature/scaffold/forkify_scaffold_not_connected.feature.dart';
import 'package:forkify/view/screen/home.screen.dart';
import 'package:forkify/view/screen/login.screen.dart';
import 'package:forkify/view/screen/map.screen.dart';
import 'package:forkify/view/screen/profile.screen.dart';
import 'package:forkify/view/screen/statistics.screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  redirect: ((context, state) {
    final user = FirebaseAuth.instance.currentUser;
    return user == null ? "/login" : null;
  }),
  routes: <RouteBase>[
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ForkifyScaffoldNotConnected(body: child);
      },
      routes: [
        GoRoute(
          path: '/login',
          builder: (BuildContext context, GoRouterState state) {
            return LoginScreen();
          },
        ),
      ],
    ),
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
