import 'package:flutter/material.dart';
import 'package:forkify/viewModel/restaurant.view_model.dart';
import 'package:forkify/viewModel/top_restaurants.view_model.dart';
import 'package:forkify/viewModel/user_statistics.view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final UserStatisticsViewModel userStatisticsViewModel =
          context.read<UserStatisticsViewModel>();
      userStatisticsViewModel.fetchUserStatistics();
      final TopRestaurantsViewModel topRestaurantsViewModelViewModel =
          context.read<TopRestaurantsViewModel>();
      topRestaurantsViewModelViewModel.fetchTopRestaurants();
      final RestaurantsViewModel restaurantsViewModel =
          context.read<RestaurantsViewModel>();
      restaurantsViewModel.fetchRestaurants();
    });
  }

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
