import 'package:flutter/material.dart';

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
        title: Text("Forkify"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () => {}, icon: Icon(Icons.account_circle_outlined)),
          )
        ],
      ),
      body: body,
      bottomNavigationBar:
          Container(height: 100, color: Theme.of(context).colorScheme.primary),
    );
  }
}
