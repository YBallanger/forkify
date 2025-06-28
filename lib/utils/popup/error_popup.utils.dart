import 'package:flutter/material.dart';

class ModalPopup extends StatelessWidget {
  const ModalPopup(
      {super.key, required this.title, required this.message, this.onClose});

  final String title;
  final String message;
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
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
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
