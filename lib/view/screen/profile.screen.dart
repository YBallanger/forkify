import 'package:flutter/material.dart';
import 'package:forkify/res/fonts.dart';
import 'package:forkify/service/authentication.service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                AuthenticationService().signOut();
              },
              style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.error),
              child: Text(
                "Se déconnecter",
                style: Fonts.bodyLarge,
              ),
            )
          ]),
    );
  }
}
