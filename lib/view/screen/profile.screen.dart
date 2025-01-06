import 'package:flutter/material.dart';
import 'package:forkify/repository/authentication.repository.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
      AuthenticationRepository().signOut();
    }, child: Text("Deconnexion"));
  }
}
