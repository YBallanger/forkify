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
  List<RestaurantStatisticsModel> _restaurantStatisticsMoney = [];
  List<RestaurantStatisticsModel> _restaurantStatisticsRating = [];
  List<RestaurantStatisticsModel> _restaurantStatisticsVisit = [];

  late final TabController _tabController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _restaurantStatisticsMoney = [
      RestaurantStatisticsModel(
          restaurant: RestaurantModel(name: "Général Tao"),
          amountSpent: 200.34,
          rating: 4.9,
          numberOfVisits: 7),
      RestaurantStatisticsModel(
          restaurant: RestaurantModel(name: "La piste"),
          amountSpent: 28.78,
          rating: 4.6,
          numberOfVisits: 7),
      RestaurantStatisticsModel(
          restaurant: RestaurantModel(name: "L'atelier du sushi"),
          amountSpent: 14.343434,
          rating: 4.2,
          numberOfVisits: 6),
    ];

    _restaurantStatisticsRating = [
      RestaurantStatisticsModel(
          restaurant: RestaurantModel(name: "Général Tao"),
          amountSpent: 200.34,
          rating: 4.9,
          numberOfVisits: 7),
      RestaurantStatisticsModel(
          restaurant: RestaurantModel(name: "La piste"),
          amountSpent: 28.78,
          rating: 4.6,
          numberOfVisits: 7),
      RestaurantStatisticsModel(
          restaurant: RestaurantModel(name: "L'atelier du sushi"),
          amountSpent: 14.343434,
          rating: 4.2,
          numberOfVisits: 6),
    ];

    _restaurantStatisticsVisit = [
      RestaurantStatisticsModel(
          restaurant: RestaurantModel(name: "Général Tao"),
          amountSpent: 200.34,
          rating: 4.9,
          numberOfVisits: 7),
      RestaurantStatisticsModel(
          restaurant: RestaurantModel(name: "La piste"),
          amountSpent: 28.78,
          rating: 4.6,
          numberOfVisits: 7),
      RestaurantStatisticsModel(
          restaurant: RestaurantModel(name: "L'atelier du sushi"),
          amountSpent: 14.343434,
          rating: 4.2,
          numberOfVisits: 6),
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void loadData() async {
  await Future.delayed(Duration(seconds: 1)); // Simule un chargement
  setState(() {
    _restaurantStatisticsMoney = [
      // vos données ici
    ];
    _restaurantStatisticsRating = [
      // vos données ici
    ];
    _restaurantStatisticsVisit = [
      // vos données ici
    ];
    _isLoading = false;
  });
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
          SizedBox(
            height: 193,
            child: TabBarView(controller: _tabController, children: [
              TopAddressesBadges(
                firstRestaurant: _restaurantStatisticsMoney[0],
                secondRestaurant: _restaurantStatisticsMoney[1],
                thirdRestaurant: _restaurantStatisticsMoney[2],
                badgesGraphType: BadgesGraphType.money,
              ),
              TopAddressesBadges(
                firstRestaurant: _restaurantStatisticsRating[0],
                secondRestaurant: _restaurantStatisticsRating[1],
                thirdRestaurant: _restaurantStatisticsRating[2],
                badgesGraphType: BadgesGraphType.rating,
              ),
              TopAddressesBadges(
                firstRestaurant: _restaurantStatisticsVisit[0],
                secondRestaurant: _restaurantStatisticsVisit[1],
                thirdRestaurant: _restaurantStatisticsVisit[2],
                badgesGraphType: BadgesGraphType.visit,
              ),
            ]),
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
