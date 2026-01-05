import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:barubatu_3_app/gen/l10n/l10n.dart';
import 'package:flutter/material.dart';

class AppDialog {
  static Future<void> showWinDialog(
    BuildContext context, {
    required String title,
    required VoidCallback onOk,
    required VoidCallback onCancel,
  }) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.infoReverse,
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

  static Future<void> showWinListDialog(BuildContext context) {
    return showDialog<void>(
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
