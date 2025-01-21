import 'package:flutter/material.dart';
import 'package:forkify/utils/popup/error_popup.utils.dart';

class ShowDialog {
  ShowDialog._();

  static void showErrorDialog({
    required BuildContext context,
    required String errorMessage,
    VoidCallback? onClose,
  }) {
    Future.microtask(() {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorPopup(
              errorMessage: errorMessage,
              onClose: onClose,
            );
          },
        );
      }
    });
  }

  static void showLoadingDialog({required BuildContext context}) {
    Future.microtask(() => {
          if (context.mounted)
            {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            }
        });
  }
}
