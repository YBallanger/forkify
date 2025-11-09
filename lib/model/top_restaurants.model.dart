import 'package:forkify/model/restaurant_statistics/restaurant_rating.model.dart';
import 'package:forkify/model/restaurant_statistics/restaurant_spending.model.dart';
import 'package:forkify/model/restaurant_statistics/restaurant_statistics.model.dart';
import 'package:forkify/model/restaurant_statistics/restaurant_visit.model.dart';

class TopRestaurantsModel {
  factory TopRestaurantsModel.fromMap(Map<String, dynamic> map) {
    return TopRestaurantsModel(
      mostVisitedRestaurants: (map['mostVisitedRestaurants'] as List<dynamic>)
          .map((e) => RestaurantVisitModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      highestSpendingRestaurants:
          (map['highestSpendingRestaurants'] as List<dynamic>)
              .map((e) =>
                  RestaurantSpendingModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      bestRatedRestaurants: (map['bestRatedRestaurants'] as List<dynamic>)
          .map((e) => RestaurantRatingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

//<editor-fold desc="Data Methods">
  const TopRestaurantsModel({
    required this.mostVisitedRestaurants,
    required this.highestSpendingRestaurants,
    required this.bestRatedRestaurants,
  });
//<editor-fold desc="Data Methods">

  final List<RestaurantStatisticsModel> mostVisitedRestaurants;
  final List<RestaurantStatisticsModel> highestSpendingRestaurants;
  final List<RestaurantStatisticsModel> bestRatedRestaurants;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TopRestaurantsModel &&
          runtimeType == other.runtimeType &&
          mostVisitedRestaurants == other.mostVisitedRestaurants &&
          highestSpendingRestaurants == other.highestSpendingRestaurants &&
          bestRatedRestaurants == other.bestRatedRestaurants);

  @override
  int get hashCode =>
      mostVisitedRestaurants.hashCode ^
      highestSpendingRestaurants.hashCode ^
      bestRatedRestaurants.hashCode;

  @override
  String toString() {
    return 'TopRestaurantsModel{' +
        ' mostVisitedRestaurants: $mostVisitedRestaurants,' +
        ' highestSpendingRestaurants: $highestSpendingRestaurants,' +
        ' bestRatedRestaurants: $bestRatedRestaurants,' +
        '}';
  }

  TopRestaurantsModel copyWith({
    List<RestaurantStatisticsModel>? mostVisitedRestaurants,
    List<RestaurantStatisticsModel>? highestSpendingRestaurants,
    List<RestaurantStatisticsModel>? bestRatedRestaurants,
  }) {
    return TopRestaurantsModel(
      mostVisitedRestaurants:
          mostVisitedRestaurants ?? this.mostVisitedRestaurants,
      highestSpendingRestaurants:
          highestSpendingRestaurants ?? this.highestSpendingRestaurants,
      bestRatedRestaurants: bestRatedRestaurants ?? this.bestRatedRestaurants,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mostVisitedRestaurants': mostVisitedRestaurants,
      'highestSpendingRestaurants': highestSpendingRestaurants,
      'bestRatedRestaurants': bestRatedRestaurants,
    };
  }

//</editor-fold>
}
