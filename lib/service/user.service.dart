import 'package:forkify/data/network/network_api.service.dart';
import 'package:forkify/model/top_restaurants.model.dart';
import 'package:forkify/model/user_statistics.model.dart';

class UserService {
  Future<UserStatisticsModel> getConnectedUserStatistics() async {
    try {
      UserStatisticsModel userStatisticsModel = UserStatisticsModel.fromMap(
          await ApiServices().getApi('/users/statistics'));
      return userStatisticsModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<TopRestaurantsModel> getConnectedUserTopRestaurants() async {
    try {
      TopRestaurantsModel topRestaurantsModel = TopRestaurantsModel.fromMap(
          await ApiServices().getApi('/users/top-restaurants'));
      return topRestaurantsModel;
    } catch (e) {
      rethrow;
    }
  }
}
