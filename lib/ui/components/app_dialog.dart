import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

// This file centralizes dialog presentation as a simple, namespaced API.
// ignore_for_file: avoid_classes_with_only_static_members, discarded_futures

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
      btnOkText: 'もう一度',
      btnCancelText: 'タイトル',
      btnCancelOnPress: onCancel,
      btnOkOnPress: onOk,
    ).show();
  }

  static Future<void> showWinListDialog(BuildContext context) {
    return showDialog<void>(
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
