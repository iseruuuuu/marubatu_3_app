import 'package:barubatu_3_app/screen/challenge_screen/challenge_screen_3.dart';
import 'package:barubatu_3_app/screen/trophy_screen/trophy_screen.dart';
import 'package:get/get.dart';
import '../challenge_screen/challenge_screen_1.dart';
import '../challenge_screen/challenge_screen_2.dart';
import '../challenge_screen/challenge_screen_5.dart';

class ChallengeScreenController extends GetxController {
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
    Get.to(() => const TrophyScreen());
  }
}
