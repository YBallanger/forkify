import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forkify/service/authentication.service.dart';

class AuthenticationViewModel extends ChangeNotifier {
  String? _errorMessage;
  bool _isLoading = false;

  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  User? get currentUser => AuthenticationService().currentUser;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  void resetErrorMessage() {
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    _setLoading(true);

    try {
      await AuthenticationService().signInWithEmail(email, password);
      _setLoading(false);
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case 'invalid-credential':
          _setErrorMessage('Les identifiants sont incorrects.');
          _setLoading(false);
          break;
        case 'network-request-failed':
          _setErrorMessage(
              'Problème de connexion réseau. Vérifiez votre internet.');
          _setLoading(false);
          break;
        default:
          _setErrorMessage('Erreur : ${exception.message}');
          _setLoading(false);
      }
    } catch (error) {
      _setErrorMessage('Erreur : ${error.toString()}');
      _setLoading(false);
    }
  }

  Future<void> signup(String email, String username, String password) async {
    _setLoading(true);

    try {
      await AuthenticationService().signUp(email, username, password);
      _setLoading(false);
    } on FirebaseAuthException catch (exception) {
      switch (exception.code) {
        case 'email-already-in-use':
          _setErrorMessage('Cet adresse email est déjà utilisé.');
          _setLoading(false);
          break;
        case 'network-request-failed':
          _setErrorMessage(
              'Problème de connexion réseau. Vérifiez votre internet.');
          _setLoading(false);
          break;
        default:
          _setErrorMessage('Erreur : ${exception.message}');
          _setLoading(false);
      }
    } catch (error) {
      _setErrorMessage('Erreur : ${error.toString()}');
      _setLoading(false);
    }
  }
}
