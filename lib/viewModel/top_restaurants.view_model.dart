import 'package:flutter/material.dart';
import 'package:forkify/model/top_restaurants.model.dart';
import 'package:forkify/service/user.service.dart';

class TopRestaurantsViewModel extends ChangeNotifier {
  TopRestaurantsModel? _topRestaurants;
  bool _isLoading = false;

  TopRestaurantsModel? get topRestaurants => _topRestaurants;
  bool get isLoading => _isLoading;
  bool get hasTopRestaurants => _topRestaurants != null;

  Future<void> fetchTopRestaurants({bool forceRefresh = false}) async {
    if (!forceRefresh && hasTopRestaurants) return;

    _isLoading = true;
    notifyListeners();

    try {
      TopRestaurantsModel topRestaurantsModel =
          await UserService().getConnectedUserTopRestaurants();

      _topRestaurants = topRestaurantsModel;
    } catch (error) {
      debugPrint(
          'Erreur lors de la récupération des données TopRestaurants : $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
