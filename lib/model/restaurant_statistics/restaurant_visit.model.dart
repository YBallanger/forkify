import 'package:forkify/model/restaurant_statistics/restaurant_statistics.model.dart';

class RestaurantVisitModel extends RestaurantStatisticsModel {
  RestaurantVisitModel(
      {required super.restaurantName, required this.totalVisits});

  factory RestaurantVisitModel.fromJson(Map<String, dynamic> json) {
    return RestaurantVisitModel(
      restaurantName: json['restaurantName'],
      totalVisits: json['totalVisits'] as int,
    );
  }
  final int totalVisits;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        ...super.toJson(),
        'totalVisits': totalVisits,
      };
}
