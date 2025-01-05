import 'package:flutter/material.dart';
import 'package:forkify/res/fonts.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Nom d'utilisateur",
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Mot de passe",
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          Center(
            child: FilledButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                "Créer votre compte",
                style: Fonts.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
