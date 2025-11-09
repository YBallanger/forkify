import 'package:flutter/material.dart';
import 'package:forkify/model/restaurant.model.dart';
import 'package:forkify/service/restaurant.service.dart';

class RestaurantsViewModel extends ChangeNotifier {
  List<RestaurantModel>? _restaurants;
  bool _isLoading = false;

  List<RestaurantModel>? get restaurants => _restaurants;
  bool get isLoading => _isLoading;

  Future<void> fetchRestaurants() async {
    _isLoading = true;
    notifyListeners();

    try {
      List<RestaurantModel> restaurantModels =
          await RestaurantService().getRestaurants();

      _restaurants = restaurantModels;
    } catch (error) {
      debugPrint(
          'Erreur lors de la récupération des données TopRestaurants : $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
