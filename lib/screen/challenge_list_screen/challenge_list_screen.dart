import 'package:barubatu_3_app/screen/challenge_screen/challenge_screen_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'challenge_list_screen_controller.dart';
import 'package:barubatu_3_app/screen/challenge_screen/challenge_screen_1.dart';
import 'package:barubatu_3_app/screen/challenge_screen/challenge_screen_2.dart';
import 'package:barubatu_3_app/screen/challenge_screen/challenge_screen_4.dart';
import 'package:barubatu_3_app/screen/challenge_screen/challenge_screen_5.dart';
import 'package:barubatu_3_app/screen/trophy_screen/trophy_screen.dart';

class ChallengeListScreen extends StatelessWidget {
  const ChallengeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChallengeScreenController(), tag: '');
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black.withValues(alpha: 0.25),
        leading: IconButton(
          iconSize: 35.w,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF00FFA3),
          ),
          onPressed: controller.onTapBack,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => TrophyScreen(
                  isClear1: controller.stage1.value,
                  isClear2: controller.stage2.value,
                  isClear3: controller.stage3.value,
                  isClear4: controller.stage4.value,
                  isClear5: controller.stage5.value,
                ),
              );
            },
            iconSize: 40.w,
            icon: const Icon(
              Icons.flag,
              color: Color(0xFF00FFA3),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/home/background.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ScaleTransition(
                    scale: controller.animationController.drive(
                      Tween<double>(
                        begin: 1,
                        end: 1.1,
                      ),
                    ),
                    child: _MenuButton(
                      label: 'レベル１',
                      onPressed: () {
                        Get.to(() => const ChallengeScreen1());
                      },
                    ),
                  ),
                  ScaleTransition(
                    scale: controller.animationController.drive(
                      Tween<double>(
                        begin: 1,
                        end: 1.13,
                      ),
                    ),
                    child: _MenuButton(
                      label: 'レベル２',
                      onPressed: () {
                        Get.to(() => const ChallengeScreen2());
                      },
                    ),
                  ),
                  ScaleTransition(
                    scale: controller.animationController.drive(
                      Tween<double>(
                        begin: 1,
                        end: 1.17,
                      ),
                    ),
                    child: _MenuButton(
                      label: 'レベル３',
                      onPressed: () {
                        Get.to(() => const ChallengeScreen3());
                      },
                    ),
                  ),
                  ScaleTransition(
                    scale: controller.animationController.drive(
                      Tween<double>(
                        begin: 1,
                        end: 1.17,
                      ),
                    ),
                    child: _MenuButton(
                      label: 'レベル４',
                      onPressed: () {
                        Get.to(() => const ChallengeScreen4());
                      },
                    ),
                  ),
                  ScaleTransition(
                    scale: controller.animationController.drive(
                      Tween<double>(
                        begin: 1,
                        end: 1.2,
                      ),
                    ),
                    child: _MenuButton(
                      label: 'レベル５',
                      onPressed: () {
                        Get.to(() => const ChallengeScreen5());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({required this.label, required this.onPressed});
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final accent = const Color(0xFF00FFA3);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.82,
      height: 64,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(22),
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: onPressed,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0B1220),
                  Color(0xFF0F172A),
                ],
              ),
              border:
                  Border.all(color: accent.withValues(alpha: 0.6), width: 2),
              boxShadow: [
                BoxShadow(
                  color: accent.withValues(alpha: 0.25),
                  blurRadius: 24,
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: accent.withValues(alpha: 0.10),
                  blurRadius: 48,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 12,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withValues(alpha: 0.08),
                            Colors.white.withValues(alpha: 0.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    label,
                    style: GoogleFonts.mPlusRounded1c(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
