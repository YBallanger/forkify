import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forkify/model/user_restaurant_statistics.model.dart';
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

  final UserRestaurantStatisticsModel firstRestaurant;
  final UserRestaurantStatisticsModel secondRestaurant;
  final UserRestaurantStatisticsModel thirdRestaurant;
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

  String getResult(UserRestaurantStatisticsModel restaurantStatistics) {
    switch (badgesGraphType) {
      case BadgesGraphType.money:
        return "${restaurantStatistics.amountSpent.toStringAsFixed(2)} €";
      case BadgesGraphType.rating:
        return "${restaurantStatistics.rating.toStringAsFixed(1)} ☆";
      case BadgesGraphType.visit:
        return "${restaurantStatistics.numberOfVisits.toStringAsFixed(0)} visites";
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
            Expanded(
              child: Column(
                children: [
                  SvgPicture.asset(
                    "asset/medal/silver-medal.svg",
                    width: 65,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    secondRestaurant.restaurant.name,
                    style: Fonts.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    getResult(secondRestaurant),
                    style: Fonts.boldBodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Expanded(
              child: Tooltip(
                message: firstRestaurant.restaurant.name,
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
                    Text(
                      firstRestaurant.restaurant.name,
                      style: Fonts.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      getResult(firstRestaurant),
                      style: Fonts.boldBodyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
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
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    getResult(thirdRestaurant),
                    style: Fonts.boldBodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
