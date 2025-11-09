import 'package:flutter/cupertino.dart';
import 'package:forkify/model/restaurant_statistics/restaurant_statistics.model.dart';

class RestaurantSpendingModel extends RestaurantStatisticsModel {
  RestaurantSpendingModel(
      {required super.restaurantName, required this.totalSpent});

  factory RestaurantSpendingModel.fromJson(Map<String, dynamic> json) {
    debugPrint(json.toString());

    return RestaurantSpendingModel(
      restaurantName: json['restaurantName'],
      totalSpent: (json['amountSpent'] as num).toDouble(),
    );
  }
  final double totalSpent;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        ...super.toJson(),
        'totalSpent': totalSpent,
      };
}
