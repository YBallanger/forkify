import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forkify/model/restaurant.model.dart';
import 'package:forkify/model/restaurant_statistics.model.dart';
import 'package:forkify/res/fonts.dart';
import 'package:forkify/view/feature/topAdresses/top_addresses.feature.dart';

class TopAddressesBadges extends StatelessWidget {
  const TopAddressesBadges({
    super.key,
    required this.firstRestaurant,
    required this.secondRestaurant,
    required this.thirdRestaurant,
    required this.badgesGraphType,
  });

  final RestaurantStatisticsModel firstRestaurant;
  final RestaurantStatisticsModel secondRestaurant;
  final RestaurantStatisticsModel thirdRestaurant;
  final BadgesGraphType badgesGraphType;

  String getTitle() {
    switch (badgesGraphType) {
      case BadgesGraphType.money:
        return "Top 3 : Dépenses";
      case BadgesGraphType.rating:
        return "Top 3 : Notes";
      case BadgesGraphType.visit:
        return "Top 3 : Visites";
    }
  }

  String getResult(RestaurantStatisticsModel restaurantStatistics) {
    switch (badgesGraphType) {
      case BadgesGraphType.money:
        return "${restaurantStatistics.amountSpent} €";
      case BadgesGraphType.rating:
        return "Top 3 : Notes";
      case BadgesGraphType.visit:
        return "Top 3 : Visites";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          getTitle(),
          style: Fonts.subtitleMedium,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 65,
              child: Column(
                children: [
                  SvgPicture.asset(
                    "asset/medal/silver-medal.svg",
                    width: 65,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(secondRestaurant.restaurant.name,
                      style: Fonts.bodySmall),
                  Text(
                    getResult(secondRestaurant),
                    style: Fonts.boldBodyMedium,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "asset/medal/gold-medal.svg",
                    width: 80,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(firstRestaurant.restaurant.name, style: Fonts.bodySmall),
                  Text(
                    getResult(firstRestaurant),
                    style: Fonts.boldBodyMedium,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 65,
              child: Column(
                children: [
                  SvgPicture.asset(
                    "asset/medal/bronze-medal.svg",
                    height: 65,
                    width: 65,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    thirdRestaurant.restaurant.name,
                    style: Fonts.bodySmall,
                  ),
                  Text(
                    getResult(thirdRestaurant),
                    style: Fonts.boldBodyMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
