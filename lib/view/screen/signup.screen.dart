import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:forkify/res/fonts.dart';
import 'package:forkify/view/feature/signupForm/signup_form.feature.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 300),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Création de compte",
              style: Fonts.titleMedium,
            ),
            SizedBox(height: 20),
            SignupForm(),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: Fonts.bodyMedium
                    .apply(color: Theme.of(context).colorScheme.onSurface),
                children: <TextSpan>[
                  TextSpan(text: "Vous avez déjà un compte ? "),
                  TextSpan(
                    text: "Se connecter.",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.go("/login");
                      },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}