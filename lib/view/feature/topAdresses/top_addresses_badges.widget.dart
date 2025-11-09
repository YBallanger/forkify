import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forkify/model/restaurant_statistics/restaurant_rating.model.dart';
import 'package:forkify/model/restaurant_statistics/restaurant_spending.model.dart';
import 'package:forkify/model/restaurant_statistics/restaurant_statistics.model.dart';
import 'package:forkify/model/restaurant_statistics/restaurant_visit.model.dart';
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
        return 'Top 3 : Dépenses';
      case BadgesGraphType.rating:
        return 'Top 3 : Notes';
      case BadgesGraphType.visit:
        return 'Top 3 : Visites';
    }
  }

  String getResult(RestaurantStatisticsModel restaurantStatistics) {
    switch (restaurantStatistics) {
      case RestaurantSpendingModel _:
        return '${restaurantStatistics.totalSpent.toStringAsFixed(2)} €';
      case RestaurantRatingModel _:
        return '${restaurantStatistics.rating.toStringAsFixed(1)} ☆';
      case RestaurantVisitModel _:
        return '${restaurantStatistics.totalVisits.toStringAsFixed(0)} visites';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          getTitle(),
          style: Fonts.subtitleMedium,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  SvgPicture.asset(
                    'asset/medal/silver-medal.svg',
                    width: 65,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    secondRestaurant.restaurantName,
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
                message: firstRestaurant.restaurantName,
                child: Column(
                  children: <Widget>[
                    SvgPicture.asset(
                      'asset/medal/gold-medal.svg',
                      width: 80,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      firstRestaurant.restaurantName,
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
                    'asset/medal/bronze-medal.svg',
                    height: 65,
                    width: 65,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    thirdRestaurant.restaurantName,
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
