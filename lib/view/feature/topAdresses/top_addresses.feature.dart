import 'package:flutter/material.dart';
import 'package:forkify/model/restaurant.model.dart';
import 'package:forkify/model/user_restaurant_statistics.model.dart';
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
  List<UserRestaurantStatisticsModel> _userRestaurantStatisticsMoney = [];
  List<UserRestaurantStatisticsModel> _userRestaurantStatisticsRating = [];
  List<UserRestaurantStatisticsModel> _userRestaurantStatisticsVisit = [];

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _userRestaurantStatisticsMoney = [
      UserRestaurantStatisticsModel(
          restaurant: RestaurantModel(name: "Général Tao"),
          amountSpent: 200.34,
          rating: 4.9,
          numberOfVisits: 7),
      UserRestaurantStatisticsModel(
          restaurant: RestaurantModel(name: "La piste"),
          amountSpent: 28.78,
          rating: 4.6,
          numberOfVisits: 7),
      UserRestaurantStatisticsModel(
          restaurant: RestaurantModel(name: "L'atelier du sushi"),
          amountSpent: 14.343434,
          rating: 4.2,
          numberOfVisits: 6),
    ];

    _userRestaurantStatisticsRating = [
      UserRestaurantStatisticsModel(
          restaurant: RestaurantModel(name: "Général Tao"),
          amountSpent: 200.34,
          rating: 4.9,
          numberOfVisits: 7),
      UserRestaurantStatisticsModel(
          restaurant: RestaurantModel(name: "La piste"),
          amountSpent: 28.78,
          rating: 4.6,
          numberOfVisits: 7),
      UserRestaurantStatisticsModel(
          restaurant: RestaurantModel(name: "L'atelier du sushi"),
          amountSpent: 14.343434,
          rating: 4.2,
          numberOfVisits: 6),
    ];

    _userRestaurantStatisticsVisit = [
      UserRestaurantStatisticsModel(
          restaurant: RestaurantModel(name: "Général Tao"),
          amountSpent: 200.34,
          rating: 4.9,
          numberOfVisits: 7),
      UserRestaurantStatisticsModel(
          restaurant: RestaurantModel(name: "La piste"),
          amountSpent: 28.78,
          rating: 4.6,
          numberOfVisits: 7),
      UserRestaurantStatisticsModel(
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
                firstRestaurant: _userRestaurantStatisticsMoney[0],
                secondRestaurant: _userRestaurantStatisticsMoney[1],
                thirdRestaurant: _userRestaurantStatisticsMoney[2],
                badgesGraphType: BadgesGraphType.money,
              ),
              TopAddressesBadges(
                firstRestaurant: _userRestaurantStatisticsRating[0],
                secondRestaurant: _userRestaurantStatisticsRating[1],
                thirdRestaurant: _userRestaurantStatisticsRating[2],
                badgesGraphType: BadgesGraphType.rating,
              ),
              TopAddressesBadges(
                firstRestaurant: _userRestaurantStatisticsVisit[0],
                secondRestaurant: _userRestaurantStatisticsVisit[1],
                thirdRestaurant: _userRestaurantStatisticsVisit[2],
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
