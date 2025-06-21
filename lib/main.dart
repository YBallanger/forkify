import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:forkify/firebase_options.dart';
import 'package:forkify/res/theme/app_theme.dart';
import 'package:forkify/utils/router.utils.dart';
import 'package:forkify/viewModel/authentication.view_model.dart';
import 'package:forkify/viewModel/user_statistics.view_model.dart';
import 'package:forkify/viewModel/user_visit_view_model.dart';
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
    providers: [
      ChangeNotifierProvider(create: (_) => UserStatisticsViewModel()),
      ChangeNotifierProvider(create: (_) => AuthenticationViewModel()),
      ChangeNotifierProvider(create: (_) => UserVisitViewModel()),
    ],
    child: MainApp(),
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
