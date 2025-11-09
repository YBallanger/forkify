import 'dart:convert';

import 'package:forkify/model/restaurant.model.dart';

class UserRestaurantStatisticsModel {
  UserRestaurantStatisticsModel({
    required this.restaurant,
    required this.amountSpent,
    required this.rating,
    required this.numberOfVisits,
  });

  factory UserRestaurantStatisticsModel.fromMap(Map<String, dynamic> map) {
    return UserRestaurantStatisticsModel(
      restaurant:
          RestaurantModel.fromMap(map['restaurant'] as Map<String, dynamic>),
      amountSpent: map['amountSpent'] as double,
      rating: map['rating'] as double,
      numberOfVisits: map['numberOfVisits'] as int,
    );
  }

  factory UserRestaurantStatisticsModel.fromJson(String source) =>
      UserRestaurantStatisticsModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
  RestaurantModel restaurant;
  double amountSpent;
  double rating;
  int numberOfVisits;

  UserRestaurantStatisticsModel copyWith({
    RestaurantModel? restaurant,
    double? amountSpent,
    double? rating,
    int? numberOfVisits,
  }) {
    return UserRestaurantStatisticsModel(
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

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'RestaurantStatisticsModel(restaurant: $restaurant, amountSpent: $amountSpent, rating: $rating, numberOfVisits: $numberOfVisits)';
  }

  @override
  bool operator ==(covariant UserRestaurantStatisticsModel other) {
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
