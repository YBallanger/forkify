import 'package:forkify/model/restaurant_statistics/restaurant_statistics.model.dart';

class RestaurantRatingModel extends RestaurantStatisticsModel {
  RestaurantRatingModel({required super.restaurantName, required this.rating});

  factory RestaurantRatingModel.fromJson(Map<String, dynamic> json) {
    return RestaurantRatingModel(
      restaurantName: json['restaurantName'],
      rating: (json['rating'] as num).toDouble(),
    );
  }

  final double rating;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        ...super.toJson(),
        'rating': rating,
      };
}
