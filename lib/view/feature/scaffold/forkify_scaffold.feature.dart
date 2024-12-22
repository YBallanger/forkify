import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForkifyScaffold extends StatefulWidget {
  const ForkifyScaffold({
    super.key,
    this.body,
  });

  final Widget? body;

  @override
  State<ForkifyScaffold> createState() => _ForkifyScaffoldState();
}

class _ForkifyScaffoldState extends State<ForkifyScaffold> {
  int _currentIndex = 1;

  void handleSwitchPage(int newIndex) {
    switch (newIndex) {
      case 0:
        context.go("/map");
      case 1:
        context.go("/");
      case 2:
        context.go("/statistics");
    }
  }

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
                onPressed: () => {context.go("/profile")},
                icon: Icon(Icons.account_circle_outlined)),
          )
        ],
      ),
      body: widget.body,
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (newIndex) {
            setState(() {
              _currentIndex = newIndex;
              handleSwitchPage(newIndex);
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on), label: "Carte"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Tableau de bord"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart), label: "Statistiques"),
          ],
        ),
      ),
    );
  }
}
