import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forkify/data/network/base_api.service.dart';
import 'package:forkify/data/network/network_api.service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth;

  AuthenticationRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      debugPrint('Error during sign in: $e');
      rethrow;
    }
  }

  Future<User?> signUp(String email, String username, String password) async {
    try {
      return await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((userCredential) async {
        await ApiServices().postApi("http://localhost:8080/users", {
          "userId": userCredential.user!.uid,
          "email": userCredential.user!.email,
          "username": username,
        });
        return userCredential.user;
      });
    } catch (e) {
      debugPrint('Error during sign up: $e');
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  User? get currentUser => _firebaseAuth.currentUser;
}
