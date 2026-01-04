// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    with TickerProviderStateMixin {
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
                  final uri = Uri.parse('https://forms.gle/eE8gJ2nQWghTfGzt6');
                  final canOpen = await canLaunchUrl(uri);
                  if (canOpen) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  } else {
                    if (!mounted) return;
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
                  final available = await inAppReview.isAvailable();
                  if (available) {
                    await inAppReview.requestReview();
                  } else {
                    if (!mounted) return;
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
          SettingsSection(
            title: const Text('音楽使用'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.music_note),
                title: Text(
                  '音楽使用',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 15.w,
                  ),
                ),
                trailing: Text(
                  '魔王魂',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 20.w,
                  ),
                ),
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
