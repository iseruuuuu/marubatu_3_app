import 'package:barubatu_3_app/screen/game_screen/game_screen.dart';
import 'package:barubatu_3_app/screen/setting_screen/setting_screen.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  void onTap() {
    Get.to(() => const GameScreen());
  }

  void onTapSetting() {
    Get.to(() => const SettingScreen());
  }
}
