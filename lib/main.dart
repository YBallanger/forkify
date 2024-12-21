import 'package:flutter/material.dart';
import 'package:forkify/res/theme/app_theme.dart';
import 'package:forkify/view/feature/scaffold/forkify_scaffold.feature.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: ForkifyScaffold(
        body: Text("HELLO MA CAILLE"),
      ),
    );
  }
}
