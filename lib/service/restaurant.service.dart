import 'package:forkify/data/network/network_api.service.dart';
import 'package:forkify/model/restaurant.model.dart';

class RestaurantService {
  Future<List<RestaurantModel>> getRestaurants() async {
    try {
      List<RestaurantModel> restaurants = (await ApiServices()
              .getApi('/restaurants'))
          .map<RestaurantModel>((dynamic item) => RestaurantModel.fromMap(item))
          .toList();
      return restaurants;
    } catch (e) {
      rethrow;
    }
  }
}
