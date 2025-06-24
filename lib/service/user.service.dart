import 'package:firebase_auth/firebase_auth.dart';
import 'package:forkify/data/network/network_api.service.dart';
import 'package:forkify/model/user_statistics.model.dart';

class UserService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserStatisticsModel> getConnectedUserStatistics() async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        UserStatisticsModel userStatisticsModel = UserStatisticsModel.fromMap(
            await ApiServices().getApi("/users/${user.uid}/statistics"));
        return userStatisticsModel;
      } else {
        throw (new Error());
      }
    } catch (e) {
      rethrow;
    }
  }
}
