import 'package:flutter/material.dart';
import 'package:forkify/model/user_statistics.model.dart';

import '../service/user.service.dart';

class UserStatisticsViewModel extends ChangeNotifier {
  UserStatisticsModel? _userStatistics;
  bool _isLoading = false;

  UserStatisticsModel? get userStatistics => _userStatistics;
  bool get isLoading => _isLoading;

  Future<void> fetchUserStatistics() async {
    _isLoading = true;
    notifyListeners();

    try {
      UserStatisticsModel userStatisticsModel =
          await UserService().getConnectedUserStatistics();

      debugPrint(userStatisticsModel.toString());
      _userStatistics = userStatisticsModel;
    } catch (error) {
      debugPrint('Erreur lors de la récupération des données : $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
