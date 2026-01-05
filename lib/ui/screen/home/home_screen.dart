import 'package:barubatu_3_app/screen/setting_screen/setting_screen.dart';
import 'package:barubatu_3_app/ui/screen/challenge_list/challenge_list_screen.dart';
import 'package:barubatu_3_app/ui/screen/game/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'component/sprite_button.dart';
import 'home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(HomeScreenController(), tag: '');

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () => Get.to(() => const GameScreen()),
                    bgImagePath: 'assets/home/circle_button.png',
                  ),
                ),
                const SizedBox(height: 20),
                ScaleTransition(
                  scale: controller.animationController.drive(
                    Tween<double>(begin: 1.04, end: 1),
                  ),
                  child: SpriteButton(
                    onPressed: () => Get.to(() => const ChallengeListScreen()),
                    bgImagePath: 'assets/home/cross_button.png',
                  ),
                ),
                const SizedBox(height: 20),
                ScaleTransition(
                  scale: controller.animationController.drive(
                    Tween<double>(begin: 1, end: 1.04),
                  ),
                  child: SpriteButton(
                    onPressed: () => Get.to(() => const SettingScreen()),
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
