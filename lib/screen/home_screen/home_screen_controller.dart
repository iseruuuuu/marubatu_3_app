import 'package:barubatu_3_app/screen/challenge_list_screen/challenge_list_screen.dart';
import 'package:barubatu_3_app/screen/game_screen/game_screen.dart';
import 'package:barubatu_3_app/screen/setting_screen/setting_screen.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:new_version/new_version.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;

  static const tapSound = 'images/tap.mp3';
  static const backgroundMusic = 'images/background.mp3';
  final AudioCache _cache = AudioCache(fixedPlayer: AudioPlayer());

  @override
  void onInit() {
    super.onInit();

    final newVersion = NewVersion(
      androidId: 'com.barubatu_3_app',
      iOSId: 'com.barubatu3App',
      iOSAppStoreCountry: 'JP',
    );
    openUpdateDialog(newVersion);

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    )..repeat(reverse: true);

    loadSound();
    _cache.loop(backgroundMusic);
  }

  void loadSound() async {
    _cache.load(tapSound);
    _cache.load(backgroundMusic);
  }

  void playSound() async {
    _cache.play(tapSound);
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
    playSound();
  }

  void onTapChallenge() {
    Get.to(() => const ChallengeListScreen());
    playSound();
  }

  void onTapSetting() {
    Get.to(() => const SettingScreen());
    playSound();
  }
}
