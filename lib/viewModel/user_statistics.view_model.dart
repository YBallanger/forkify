import 'package:flutter/material.dart';
import 'package:forkify/model/user_statistics.model.dart';
import 'package:forkify/service/user.service.dart';

class UserStatisticsViewModel extends ChangeNotifier {
  UserStatisticsModel? _userStatistics;
  bool _isLoading = false;

  UserStatisticsModel? get userStatistics => _userStatistics;
  bool get isLoading => _isLoading;
  bool get hasStatistics => _userStatistics != null;

  Future<void> fetchUserStatistics({bool forceRefresh = false}) async {
    if (!forceRefresh && _userStatistics != null) {
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      UserStatisticsModel userStatisticsModel =
          await UserService().getConnectedUserStatistics();
      _userStatistics = userStatisticsModel;
    } catch (error) {
      debugPrint('Erreur lors de la récupération des données : $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearStatistics() {
    _userStatistics = null;
    notifyListeners();
  }
}
