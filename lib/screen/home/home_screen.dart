import 'package:barubatu_3_app/screen/challenge_list_screen/challenge_list_screen.dart';
import 'package:barubatu_3_app/screen/game_screen/game_screen.dart';
import 'package:barubatu_3_app/screen/setting_screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:barubatu_3_app/model/color.dart';
import 'component/button_item.dart';
import 'home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(HomeScreenController(), tag: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D16),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0D0D16), Color(0xFF111122)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(FontAwesomeIcons.circle,
                      size: 42, color: ColorStyle.blue),
                  const SizedBox(width: 8),
                  const Icon(Icons.clear, size: 48, color: ColorStyle.red),
                  const SizedBox(width: 8),
                  const Icon(
                    FontAwesomeIcons.square,
                    size: 42,
                    color: ColorStyle.green,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'GAME',
                    style: GoogleFonts.pressStart2p(
                      fontSize: 36,
                      color: const Color(0xFF00FFA3),
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 56),
              ScaleTransition(
                scale: controller.animationController.drive(
                  Tween<double>(begin: 1, end: 1.05),
                ),
                child: ButtonItem(
                  onPressed: () => Get.to(() => const GameScreen()),
                  text: '3人で対戦',
                ),
              ),
              const SizedBox(height: 56),
              ScaleTransition(
                scale: controller.animationController.drive(
                  Tween<double>(begin: 1.05, end: 1),
                ),
                child: ButtonItem(
                  onPressed: () => Get.to(() => const ChallengeListScreen()),
                  text: 'チャレンジモード',
                ),
              ),
              const SizedBox(height: 56),
              ScaleTransition(
                scale: controller.animationController.drive(
                  Tween<double>(begin: 1, end: 1.05),
                ),
                child: ButtonItem(
                  onPressed: () => Get.to(() => const SettingScreen()),
                  text: 'SETTING',
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
