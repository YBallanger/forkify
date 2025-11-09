import 'package:flutter/material.dart';
import 'package:forkify/utils/popup/error_popup.utils.dart';

class ShowDialog {
  ShowDialog._();

  static void showModalDialog({
    required BuildContext context,
    required String title,
    required String message,
    VoidCallback? onClose,
  }) {
    Future.microtask(() {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ModalPopup(
              title: title,
              message: message,
              onClose: onClose,
            );
          },
        );
      }
    });
  }

  static void showLoadingDialog({required BuildContext context}) {
    Future.microtask(() => <Set<Future>>{
          if (context.mounted)
            {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            }
        });
  }
}
