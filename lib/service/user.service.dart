import 'package:firebase_auth/firebase_auth.dart';
import 'package:forkify/data/network/network_api.service.dart';
import 'package:forkify/model/user_statistics.model.dart';

class UserService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserStatisticsModel> getConnectedUserStatistics() async {
    try {
      UserStatisticsModel userStatisticsModel = UserStatisticsModel.fromMap(
          await ApiServices().getApi("/users/statistics"));
      return userStatisticsModel;
    } catch (e) {
      rethrow;
    }
  }
}
