import 'package:flutter/material.dart';
import 'package:forkify/model/dto/user_visit_create.dto.dart';
import 'package:forkify/service/user_visit.service.dart';

class UserVisitViewModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> createUserVisit(UserVisitCreateDTO userVisitCreateDTO) async {
    _isLoading = true;
    notifyListeners();
    try {
      UserVisitService().createUserVisit(userVisitCreateDTO);
    } catch (error) {
      debugPrint('Erreur lors de la crétion d\'expérience : $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
