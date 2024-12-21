import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForkifyScaffold extends StatelessWidget {
  const ForkifyScaffold({
    super.key, 
    this.body,
  });

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text("Forkify"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () => {
                  context.go("/profile")
                }, icon: Icon(Icons.account_circle_outlined)),
          )
        ],
      ),
      body: body,
      bottomNavigationBar:
          Container(height: 80, color: Theme.of(context).colorScheme.primary),
    );
  }
}
