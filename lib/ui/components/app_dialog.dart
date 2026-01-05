import 'package:flutter/material.dart';
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
      btnOkText: 'もう一度',
      btnCancelText: 'タイトル',
      btnCancelOnPress: onCancel,
      btnOkOnPress: onOk,
    ).show();
  }

  static void showWinListDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Center(
            child: Text(
              '勝ち手一覧',
              style: TextStyle(
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
