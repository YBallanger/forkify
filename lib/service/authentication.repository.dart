import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forkify/data/network/network_api.service.dart';
import 'package:forkify/model/user.model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signUp(String email, String username, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user = UserModel(
          userId: userCredential.user!.uid, email: email, username: username);

      await ApiServices().postApi("/users", user.toMap());
    } catch (e) {
      debugPrint('Error during sign up or backend request: $e');

      try {
        await _firebaseAuth.currentUser?.delete();
      } catch (deleteError) {
        debugPrint('Failed to delete user from Firebase: $deleteError');
      }

      rethrow;
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      UserModel user = UserModel(
          userId: userCredential.user!.uid, email: userCredential.user!.uid, username: userCredential.user!.displayName ?? "Utilisateur");
      await ApiServices().postApi("/users", user.toMap());
    } catch (e) {
      debugPrint('Error during sign up or backend request: $e');

      try {
        await _firebaseAuth.currentUser?.delete();
      } catch (deleteError) {
        debugPrint('Failed to delete user from Firebase: $deleteError');
      }

      rethrow;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  User? get currentUser => _firebaseAuth.currentUser;
}
