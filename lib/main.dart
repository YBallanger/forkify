import 'package:flutter/material.dart';
import 'package:forkify/res/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(onPressed: () => {}, icon: Icon(Icons.menu)),
                  Text("Forkify"),
                  IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.account_circle_outlined))
                ],
              ),
            ),
            body: Center(
              child: const Text("HELLO WORLD !"),
            ),
            bottomNavigationBar: Container(
                height: 100, color: Theme.of(context).colorScheme.primary),
          );
        },
      ),
    );
  }
}
