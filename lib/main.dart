import 'package:flutter/material.dart';
import 'package:forkify/res/theme/app_theme.dart';
import 'package:forkify/utils/router.utils.dart';

void main() {
  runApp(const MainApp());
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
