import 'package:barubatu_3_app/screen/challenge_screen/challenge_screen_3.dart';
import 'package:barubatu_3_app/screen/trophy_screen/trophy_screen.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import '../../preference/shared_preference.dart';
import '../challenge_screen/challenge_screen_1.dart';
import '../challenge_screen/challenge_screen_2.dart';
import '../challenge_screen/challenge_screen_5.dart';

class ChallengeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var stage1 = false.obs;
  var stage2 = false.obs;
  var stage3 = false.obs;
  var stage4 = false.obs;
  var stage5 = false.obs;

  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();
    sharedPreference();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  void onTapBack() {
    Get.back();
  }

  Future<void> sharedPreference() async {
    stage1.value = await Preference().getBool(PreferenceKey.stage1);
    stage2.value = await Preference().getBool(PreferenceKey.stage2);
    stage3.value = await Preference().getBool(PreferenceKey.stage3);
    stage4.value = await Preference().getBool(PreferenceKey.stage4);
    stage5.value = await Preference().getBool(PreferenceKey.stage5);
  }

  void onTapLevel1() {
    Get.to(() => const ChallengeScreen1());
  }

  void onTapLevel2() {
    Get.to(() => const ChallengeScreen2());
  }

  void onTapLevel3() {
    Get.to(() => const ChallengeScreen3());
  }

  void onTapLevel4() {
    Get.to(() => const ChallengeScreen5());
  }

  void onTapLevel5() {
    Get.to(() => const ChallengeScreen5());
  }

  void onTapTrophyScreen() {
    Get.to(
      () => TrophyScreen(
        isClear1: stage1.value,
        isClear2: stage2.value,
        isClear3: stage3.value,
        isClear4: stage4.value,
        isClear5: stage5.value,
      ),
    );
  }
}
