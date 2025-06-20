import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forkify/res/fonts.dart';
import 'package:forkify/service/authentication.service.dart';

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        await AuthenticationService().signInWithGoogle();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(60),
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "asset/google.svg",
            height: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              "Se connecter avec Google",
              style: Fonts.bodyMedium
                  .apply(color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}
