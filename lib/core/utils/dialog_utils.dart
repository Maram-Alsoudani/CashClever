import 'package:CashClever/core/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(
      {required BuildContext context, required String message}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        // Prevent dismissing the dialog by tapping outside
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.white,
            content: Row(
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    style: TextStyle(color: AppColors.black),
                  ),
                ),
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String title = "",
    String? posActionName,
    Function? posAction,
    String? negActionName,
    Function? negAction,
  }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(
            posActionName,
            style: TextStyle(color: AppColors.primary),
          )));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(
            negActionName,
            style: TextStyle(color: AppColors.black),
          )));
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.white,
            content: Text(
              message,
              style: TextStyle(
                color: AppColors.black,
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                  color: title.toLowerCase() == "failed"
                      ? AppColors.red
                      : AppColors.black,
                  fontSize: 22),
            ),
            actions: actions,
          );
        });
  }
}