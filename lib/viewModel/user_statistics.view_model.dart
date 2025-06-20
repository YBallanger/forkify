import 'package:flutter/material.dart';
import 'package:forkify/model/dto/user_statistics.dto.dart';

class UserStatisticsViewModel extends ChangeNotifier {
  UserStatisticsDTO? _userStatistics;
  bool _isLoading = false;

  UserStatisticsDTO? get userStatistics => _userStatistics;
  bool get isLoading => _isLoading;

  Future<void> fetchUserStatistics() async {
    _isLoading = true;
    notifyListeners();

    try {
      await Future.delayed(Duration(seconds: 2));
      final data = {
        "amountSpent": 150.75,
        "numberOfVisits": 20,
        "numberOfNewRestaurants": 5,
      };

      _userStatistics = UserStatisticsDTO.fromMap(data);
    } catch (error) {
      debugPrint('Erreur lors de la récupération des données : $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
