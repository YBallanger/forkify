import 'package:flutter/material.dart';
import 'package:forkify/res/fonts.dart';
import 'package:forkify/utils/popup/show_dialog.utils.dart';
import 'package:forkify/viewModel/authentication.view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoadingDialogOpen = false;

  void showLoadingDialog(BuildContext context) {
    if (!_isLoadingDialogOpen) {
      _isLoadingDialogOpen = true;
      ShowDialog.showLoadingDialog(context: context);
    }
  }

  void hideLoadingDialog(BuildContext context) {
    if (_isLoadingDialogOpen) {
      Navigator.of(context, rootNavigator: true).pop();
      _isLoadingDialogOpen = false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationViewModel>(builder: (BuildContext context,
        AuthenticationViewModel viewModel, Widget? child) {
      if (viewModel.isLoading) {
        showLoadingDialog(context);
      } else {
        hideLoadingDialog(context);
      }
      if (viewModel.errorMessage != null) {
        ShowDialog.showModalDialog(
            title: "Erreur",
            context: context,
            message: viewModel.errorMessage!,
            onClose: () => {
                  viewModel.resetErrorMessage(),
                });
      }
      return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.mail_outline),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "L'email ne doit pas être vide";
                }
                final RegExp emailRegex = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                if (!emailRegex.hasMatch(value)) {
                  return "L'email n'est pas valide";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  labelText: 'Mot de passe',
                  prefixIcon: Icon(Icons.lock_outline)),
              obscureText: true,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Le mot de passe ne doit pas être vide';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final String email = _emailController.text;
                  final String password = _passwordController.text;
                  await viewModel.signIn(email, password);
                  if (context.mounted) {
                    hideLoadingDialog(context);
                    context.go('/');
                  }
                }
              },
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                'Se connecter',
                style: Fonts.bodyLarge,
              ),
            ),
          ],
        ),
      );
    });
  }
}
