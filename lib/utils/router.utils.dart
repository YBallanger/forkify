import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forkify/view/feature/scaffold/forkify_scaffold.feature.dart';
import 'package:forkify/view/feature/scaffold/forkify_scaffold_not_connected.feature.dart';
import 'package:forkify/view/screen/home.screen.dart';
import 'package:forkify/view/screen/login.screen.dart';
import 'package:forkify/view/screen/map.screen.dart';
import 'package:forkify/view/screen/profile.screen.dart';
import 'package:forkify/view/screen/signup.screen.dart';
import 'package:forkify/view/screen/statistics.screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    //Screens with not connected scaffold
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ForkifyScaffoldNotConnected(body: child);
      },
      routes: [
        GoRoute(
          path: '/login',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              NoTransitionPage(
            child: const LoginScreen(),
          ),
        ),
        GoRoute(
          path: '/signup',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              NoTransitionPage(
            child: const SignupScreen(),
          ),
        ),
      ],
    ),
    // Screens with regular scaffold
    ShellRoute(
      redirect: ((context, state) {
        final user = FirebaseAuth.instance.currentUser;
        return user == null ? "/login" : null;
      }),
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ForkifyScaffold(body: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              NoTransitionPage(
            child: const HomeScreen(),
          ),
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              NoTransitionPage(
            child: const ProfileScreen(),
          ),
        ),
        GoRoute(
          path: '/statistics',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              NoTransitionPage(
            child: const StatisticsScreen(),
          ),
        ),
        GoRoute(
          path: '/map',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              NoTransitionPage(
            child: const MapScreen(),
          ),
        ),
      ],
    ),
  ],
);
