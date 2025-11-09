import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:forkify/firebase_options.dart';
import 'package:forkify/res/theme/app_theme.dart';
import 'package:forkify/utils/router.utils.dart';
import 'package:forkify/viewModel/authentication.view_model.dart';
import 'package:forkify/viewModel/top_restaurants.view_model.dart';
import 'package:forkify/viewModel/user_statistics.view_model.dart';
import 'package:forkify/viewModel/user_visit.view_model.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    router.refresh();
  });

  runApp(MultiProvider(
    providers: <SingleChildWidget>[
      ChangeNotifierProvider<AuthenticationViewModel>(
          create: (_) => AuthenticationViewModel()),
      ChangeNotifierProvider<TopRestaurantsViewModel>(
          create: (_) => TopRestaurantsViewModel()),
      ChangeNotifierProvider<UserStatisticsViewModel>(
          create: (_) => UserStatisticsViewModel()),
      ChangeNotifierProvider<UserVisitViewModel>(
          create: (_) => UserVisitViewModel()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.lightTheme,
    );
  }
}
