import 'package:barubatu_3_app/ui/screen/challenge_list/challenge_list_screen.dart';
import 'package:barubatu_3_app/ui/screen/game/game_screen.dart';
import 'package:barubatu_3_app/ui/screen/home/component/sprite_button.dart';
import 'package:barubatu_3_app/ui/screen/home/home_screen_controller.dart';
import 'package:barubatu_3_app/ui/screen/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeScreenController controller =
      Get.put(HomeScreenController(), tag: '');

  @override
  Widget build(BuildContext context) {
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return Scaffold(
      backgroundColor: const Color(0xFF0D1224),
      body: Stack(
        children: [
          // 背景グラデーション
          Positioned.fill(
            child: Image.asset(
              'assets/home/background.png',
              fit: BoxFit.cover,
            ),
          ),
          // 本文
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                _HeaderImage(),
                const SizedBox(height: 32),
                // メニュー
                ScaleTransition(
                  scale: controller.animationController.drive(
                    Tween<double>(begin: 1, end: 1.04),
                  ),
                  child: SpriteButton(
                    onPressed: () => Get.to<void>(() => const GameScreen()),
                    bgImagePath: isEnglish
                        ? 'assets/home/circle_button_en.png'
                        : 'assets/home/circle_button.png',
                  ),
                ),
                const SizedBox(height: 20),
                ScaleTransition(
                  scale: controller.animationController.drive(
                    Tween<double>(begin: 1.04, end: 1),
                  ),
                  child: SpriteButton(
                    onPressed: () =>
                        Get.to<void>(() => const ChallengeListScreen()),
                    bgImagePath: isEnglish
                        ? 'assets/home/cross_button_en.png'
                        : 'assets/home/cross_button.png',
                  ),
                ),
                const SizedBox(height: 20),
                ScaleTransition(
                  scale: controller.animationController.drive(
                    Tween<double>(begin: 1, end: 1.04),
                  ),
                  child: SpriteButton(
                    onPressed: () async =>
                        await Get.to<void>(() => const SettingScreen()),
                    bgImagePath: 'assets/home/square_button.png',
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 800 / 533, // 参考画像比率
        child: Image.asset(
          'assets/home/header.png',
          width: width * 0.96,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
