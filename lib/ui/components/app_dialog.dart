import 'package:flutter/material.dart';
import 'package:barubatu_3_app/gen/l10n/l10n.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class AppDialog {
  static void showWinDialog(
    BuildContext context, {
    required String title,
    required VoidCallback onOk,
    required VoidCallback onCancel,
  }) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.infoReverse,
      barrierColor: Colors.grey.shade100,
      dismissOnTouchOutside: true,
      animType: AnimType.scale,
      title: title,
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.black,
      ),
      btnOkText: L10n.of(context).btnOkAgain,
      btnCancelText: L10n.of(context).btnCancelTitle,
      btnCancelOnPress: onCancel,
      btnOkOnPress: onOk,
    ).show();
  }

  static void showWinListDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Center(
            child: Text(
              L10n.of(context).winListTitle,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          content: Image.asset(
            'assets/images/dialog.png',
          ),
        );
      },
    );
  }
}
