import 'package:flutter/material.dart';
import 'package:forkify/repository/authentication.repository.dart';
import 'package:forkify/res/fonts.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: "Email",
              prefixIcon: Icon(Icons.mail_outline),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "L'email ne doit pas être vide";
              }
              final emailRegex = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
              if (!emailRegex.hasMatch(value)) {
                return "L'email n'est pas valide";
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: "Nom d'utilisateur",
              prefixIcon: Icon(Icons.person_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Le nom d'utilisateur ne doit pas être vide";
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: "Mot de passe",
              prefixIcon: Icon(Icons.lock_outline),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Le mot de passe ne doit pas être vide';
              }
              final passwordRegex = RegExp(r'^.{10,}$');
              if (!passwordRegex.hasMatch(value)) {
                return 'Minimum 10 caractères';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          FilledButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final email = _emailController.text;
                final password = _passwordController.text;
                final username = _usernameController.text;
                await AuthenticationRepository().signUp(email, username, password);
              }
            },
            style: FilledButton.styleFrom(
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
        ],
      ),
    );
  }
}
