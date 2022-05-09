import 'package:barubatu_3_app/screen/challenge_list_screen/challenge_list_screen.dart';
import 'package:barubatu_3_app/screen/game_screen/game_screen.dart';
import 'package:barubatu_3_app/screen/setting_screen/setting_screen.dart';
import 'package:get/get.dart';
import 'package:new_version/new_version.dart';

class HomeScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    final newVersion = NewVersion(
        androidId: 'com.barubatu_3_app',
        iOSId: 'com.barubatu3App',
        iOSAppStoreCountry: 'JP');
    openUpdateDialog(newVersion);
  }

  void openUpdateDialog(NewVersion newVersion) async {
    final status = await newVersion.getVersionStatus();
    if (status != null && status.canUpdate) {
      //アップデートが必要か否かチェック
      String storeVersion = status.storeVersion;
      String releaseNote = status.releaseNotes.toString();
      newVersion.showUpdateDialog(
        context: Get.context!,
        versionStatus: status,
        dialogTitle: 'アップデートが必要です。',
        dialogText:
            'Ver.$storeVersionが公開されています。\n最新バージョンにアップデートをお願いします。\n\nバージョンアップ内容は以下の通りです。\n$releaseNote',
        updateButtonText: 'アップデート',
        allowDismissal: false,
      );
    }
  }

  void onTap() {
    Get.to(() => const GameScreen());
  }
  
  void onTapChallenge() {
    Get.to(() => const ChallengeListScreen());
  }

  void onTapSetting() {
    Get.to(() => const SettingScreen());
  }
}
