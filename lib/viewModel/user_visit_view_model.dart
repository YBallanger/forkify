import 'package:flutter/material.dart';
import 'package:forkify/model/dto/user_visit_create.dto.dart';
import 'package:forkify/service/user_visit.service.dart';

class UserVisitViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool _isError = false;

  bool get isLoading => _isLoading;
  bool get isError => _isError;

  Future<void> createUserVisit(UserVisitCreateDTO userVisitCreateDTO) async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    try {
      UserVisitService().createUserVisit(userVisitCreateDTO);
    } catch (error) {
      _isError = true;
      debugPrint('Erreur lors de la crétion d\'expérience : $error');
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
