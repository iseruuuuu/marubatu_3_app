import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InAppReview inAppReview = InAppReview.instance;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.secondarySystemBackground,
        elevation: 0,
        title: const Text(
          '設定',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.black,
          iconSize: 30,
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text(''),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.local_police),
                title: const Text('ライセンス'),
                onPressed: (context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LicensePage(),
                    ),
                  );
                },
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.mail),
                title: const Text('お問い合わせ'),
                onPressed: (context) async {
                  const url = 'https://forms.gle/eE8gJ2nQWghTfGzt6';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    openDialog(
                      context: context,
                      title: 'URLエラー',
                      content: 'URLが開けませんでした。\n'
                          'もう一度押してみるか、\n'
                          '一度アプリを再起動してみてください。',
                    );
                  }
                },
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.star),
                title: const Text('レビューする'),
                onPressed: (context) async {
                  if (await inAppReview.isAvailable()) {
                    inAppReview.requestReview();
                  } else {
                    openDialog(
                      context: context,
                      title: 'レビューができませんでした。',
                      content: 'レビューができませんでした。\n'
                          'お手数ですが、もう一度お試しください',
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void openDialog({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            CupertinoDialogAction(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
