// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:forkify/model/restaurant.model.dart';

class RestaurantStatisticsModel {
  RestaurantModel restaurant;
  double amountSpent;
  int rating;
  int numberOfVisits;

  RestaurantStatisticsModel({
    required this.restaurant,
    required this.amountSpent,
    required this.rating,
    required this.numberOfVisits,
  });

  RestaurantStatisticsModel copyWith({
    RestaurantModel? restaurant,
    double? amountSpent,
    int? rating,
    int? numberOfVisits,
  }) {
    return RestaurantStatisticsModel(
      restaurant: restaurant ?? this.restaurant,
      amountSpent: amountSpent ?? this.amountSpent,
      rating: rating ?? this.rating,
      numberOfVisits: numberOfVisits ?? this.numberOfVisits,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'restaurant': restaurant.toMap(),
      'amountSpent': amountSpent,
      'rating': rating,
      'numberOfVisits': numberOfVisits,
    };
  }

  factory RestaurantStatisticsModel.fromMap(Map<String, dynamic> map) {
    return RestaurantStatisticsModel(
      restaurant:
          RestaurantModel.fromMap(map['restaurant'] as Map<String, dynamic>),
      amountSpent: map['amountSpent'] as double,
      rating: map['rating'] as int,
      numberOfVisits: map['numberOfVisits'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory RestaurantStatisticsModel.fromJson(String source) =>
      RestaurantStatisticsModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RestaurantStatisticsModel(restaurant: $restaurant, amountSpent: $amountSpent, rating: $rating, numberOfVisits: $numberOfVisits)';
  }

  @override
  bool operator ==(covariant RestaurantStatisticsModel other) {
    if (identical(this, other)) return true;

    return other.restaurant == restaurant &&
        other.amountSpent == amountSpent &&
        other.rating == rating &&
        other.numberOfVisits == numberOfVisits;
  }

  @override
  int get hashCode {
    return restaurant.hashCode ^
        amountSpent.hashCode ^
        rating.hashCode ^
        numberOfVisits.hashCode;
  }
}
