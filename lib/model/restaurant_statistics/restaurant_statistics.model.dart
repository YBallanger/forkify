abstract class RestaurantStatisticsModel {
  RestaurantStatisticsModel({required this.restaurantName});
  final String restaurantName;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'restaurantName': restaurantName,
      };

  static T fromJson<T extends RestaurantStatisticsModel>(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) creator) {
    return creator(json);
  }
}
