import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:forkify/res/fonts.dart';
import 'package:forkify/view/feature/googleSignIn/google_sign_in.feature.dart';
import 'package:forkify/view/feature/loginForm/login_form.feature.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 300),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginForm(),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Ou",
                    style: Fonts.bodyMedium
                        .apply(color: Theme.of(context).colorScheme.outline),
                  ),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 20),
            GoogleSignIn(),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: Fonts.bodyMedium
                    .apply(color: Theme.of(context).colorScheme.onSurface),
                children: <TextSpan>[
                  TextSpan(text: "Pas encore de compte ? "),
                  TextSpan(
                    text: "Créer un compte.",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('Création de compte');
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
