import 'package:flutter/material.dart';
import 'package:forkify/res/theme/app_theme.dart';
import 'package:forkify/utils/router.utils.dart';
import 'package:forkify/viewModel/user_statistics.view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserStatisticsViewModel()),
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
