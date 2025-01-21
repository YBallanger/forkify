import 'package:flutter/material.dart';

class ForkifyScaffoldNotConnected extends StatelessWidget {
  const ForkifyScaffoldNotConnected({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text("Forkify"),
      ),
      body: body,
    );
  }
}
