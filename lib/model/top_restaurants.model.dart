import 'package:forkify/model/user_restaurant_statistics.model.dart';

class TopRestaurantsModel {
  final List<UserRestaurantStatisticsModel> mostVisitedRestaurants;
  final List<UserRestaurantStatisticsModel> highestSpendingRestaurants;
  final List<UserRestaurantStatisticsModel> bestRatedRestaurants;
//<editor-fold desc="Data Methods">
  const TopRestaurantsModel({
    required this.mostVisitedRestaurants,
    required this.highestSpendingRestaurants,
    required this.bestRatedRestaurants,
  });

  factory TopRestaurantsModel.fromMap(Map<String, dynamic> map) {
    return TopRestaurantsModel(
      mostVisitedRestaurants:
          map['mostVisitedRestaurants'] as List<UserRestaurantStatisticsModel>,
      highestSpendingRestaurants: map['highestSpendingRestaurants']
          as List<UserRestaurantStatisticsModel>,
      bestRatedRestaurants:
          map['bestRatedRestaurants'] as List<UserRestaurantStatisticsModel>,
    );
  }

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
    List<UserRestaurantStatisticsModel>? mostVisitedRestaurants,
    List<UserRestaurantStatisticsModel>? highestSpendingRestaurants,
    List<UserRestaurantStatisticsModel>? bestRatedRestaurants,
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
    return {
      'mostVisitedRestaurants': this.mostVisitedRestaurants,
      'highestSpendingRestaurants': this.highestSpendingRestaurants,
      'bestRatedRestaurants': this.bestRatedRestaurants,
    };
  }

//</editor-fold>
}
