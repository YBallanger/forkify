import 'package:flutter/material.dart';
import 'package:forkify/res/fonts.dart';
import 'package:forkify/view/feature/topAdresses/top_addresses_badges.widget.dart';
import 'package:forkify/view/feature/topAdresses/top_addresses_tab_bar.widget.dart';
import 'package:forkify/viewModel/top_restaurants.view_model.dart';
import 'package:provider/provider.dart';

class TopAddresses extends StatefulWidget {
  const TopAddresses({
    super.key,
  });

  @override
  State<TopAddresses> createState() => _TopAddressesState();
}

class _TopAddressesState extends State<TopAddresses>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final TopRestaurantsViewModel topRestaurantsViewModelViewModel =
          context.read<TopRestaurantsViewModel>();
      topRestaurantsViewModelViewModel.fetchTopRestaurants();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TopRestaurantsViewModel topRestaurantsViewModelViewModel =
        Provider.of<TopRestaurantsViewModel>(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Vos meilleures adresses',
            style: Fonts.titleMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          TopAddressesTabBar(
            tabController: _tabController,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 193,
            child: topRestaurantsViewModelViewModel.topRestaurants != null
                ? TabBarView(controller: _tabController, children: <Widget>[
                    TopAddressesBadges(
                      firstRestaurant: topRestaurantsViewModelViewModel
                          .topRestaurants!.highestSpendingRestaurants[0],
                      secondRestaurant: topRestaurantsViewModelViewModel
                          .topRestaurants!.highestSpendingRestaurants[1],
                      thirdRestaurant: topRestaurantsViewModelViewModel
                          .topRestaurants!.highestSpendingRestaurants[2],
                      badgesGraphType: BadgesGraphType.money,
                    ),
                    TopAddressesBadges(
                      firstRestaurant: topRestaurantsViewModelViewModel
                          .topRestaurants!.bestRatedRestaurants[0],
                      secondRestaurant: topRestaurantsViewModelViewModel
                          .topRestaurants!.bestRatedRestaurants[1],
                      thirdRestaurant: topRestaurantsViewModelViewModel
                          .topRestaurants!.bestRatedRestaurants[2],
                      badgesGraphType: BadgesGraphType.rating,
                    ),
                    TopAddressesBadges(
                      firstRestaurant: topRestaurantsViewModelViewModel
                          .topRestaurants!.mostVisitedRestaurants[0],
                      secondRestaurant: topRestaurantsViewModelViewModel
                          .topRestaurants!.mostVisitedRestaurants[1],
                      thirdRestaurant: topRestaurantsViewModelViewModel
                          .topRestaurants!.mostVisitedRestaurants[2],
                      badgesGraphType: BadgesGraphType.visit,
                    ),
                  ])
                : const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}

enum BadgesGraphType {
  money,
  rating,
  visit,
}
