import 'package:flutter/material.dart';

class ErrorPopup extends StatelessWidget {
  const ErrorPopup({super.key, required this.errorMessage, this.onClose});

  final String errorMessage;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          if (onClose != null) {
            onClose!();
          }
          return;
        }
      },
      child: AlertDialog(
        title: const Text('Echec de connexion'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(errorMessage),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Fermer'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
