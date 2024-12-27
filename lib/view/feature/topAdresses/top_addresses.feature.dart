import 'dart:math';

import 'package:flutter/material.dart';
import 'package:forkify/model/restaurant.model.dart';
import 'package:forkify/model/restaurant_statistics.model.dart';
import 'package:forkify/res/fonts.dart';
import 'package:forkify/view/feature/topAdresses/top_addresses_badges.widget.dart';
import 'package:forkify/view/feature/topAdresses/top_addresses_tab_bar.widget.dart';

class TopAddresses extends StatefulWidget {
  const TopAddresses({
    super.key,
  });

  @override
  State<TopAddresses> createState() => _TopAddressesState();
}

class _TopAddressesState extends State<TopAddresses>
    with TickerProviderStateMixin {
  final List<RestaurantStatisticsModel> _restaurantStatistics = [];

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
          Text(
            "Vos meilleures adresses",
            style: Fonts.titleMedium,
          ),
          SizedBox(
            height: 20,
          ),
          TopAddressesTabBar(
            tabController: _tabController,
          ),
          SizedBox(
            height: 20,
          ),
          TopAddressesBadges(
            firstRestaurant: RestaurantStatisticsModel(
                restaurant: RestaurantModel(name: "res1"),
                amountSpent: 4,
                rating: 4,
                numberOfVisits: 7),
            secondRestaurant: RestaurantStatisticsModel(
                restaurant: RestaurantModel(name: "res2"),
                amountSpent: 12,
                rating: 4,
                numberOfVisits: 7),
            thirdRestaurant: RestaurantStatisticsModel(
                restaurant: RestaurantModel(name: "res3"),
                amountSpent: 14,
                rating: 2,
                numberOfVisits: 67),
            badgesGraphType: BadgesGraphType.money,
          )
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
