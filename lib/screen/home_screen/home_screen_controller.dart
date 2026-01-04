import 'package:flutter/material.dart';

// Package imports:
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:new_version/new_version.dart';

// Project imports:
import 'package:barubatu_3_app/screen/challenge_list_screen/challenge_list_screen.dart';
import 'package:barubatu_3_app/screen/game_screen/game_screen.dart';
import 'package:barubatu_3_app/screen/setting_screen/setting_screen.dart';

class HomeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin, WidgetsBindingObserver, RouteAware {
  late AnimationController animationController;

  //static const bgm = 'images/background.mp3';
  //final AudioCache bgmCache = AudioCache(fixedPlayer: AudioPlayer());
  //AudioPlayer? bgmPlayer;
  static const tap = 'images/tap.mp3';
  final AudioCache tapCache = AudioCache(fixedPlayer: AudioPlayer());
  AudioPlayer? tapPlayer;

  // late BannerAd banner;

  @override
  void onInit() {
    super.onInit();
    // loadAd();
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
    // loadBgm(name: bgm);
    loadTap();
    WidgetsBinding.instance.addObserver(this);
  }

  // void loadAd() {
  //   final adState = Provider.of<AdState>(Get.overlayContext!);
  //   adState.initialization.then((status) {
  //       banner = BannerAd(
  //         adUnitId: adState.bannerAdUnitId,
  //         size: AdSize.banner,
  //         request: const AdRequest(),
  //         listener: adState.adListener,
  //       )..load();
  //   });
  // }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    // onBackground();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // onForeground();
    } else if (state == AppLifecycleState.paused) {
      // onBackground();
    }
  }

  // void loadBgm({required String name, bool isLoop = true}) {
  //   () async {
  //     await bgmPlayer?.stop();
  //     await bgmPlayer?.dispose();
  //     bgmPlayer = await bgmCache.loop(name, mode: PlayerMode.MEDIA_PLAYER);
  //   }();
  // }

  void loadTap() async {
    tapCache.load(tap);
  }

  void playTap() async {
    tapCache.play(tap);
  }

  // void onBackground() {
  //   bgmPlayer?.pause();
  // }
  //
  // void onForeground() {
  //   bgmPlayer?.resume();
  // }

  void openUpdateDialog(NewVersion newVersion) async {
    final status = await newVersion.getVersionStatus();
    if (status != null && status.canUpdate) {
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
    Get.to(() => const GameScreen())?.then((value) {
      //onForeground();
    });
    playTap();
    // onBackground();
  }

  void onTapChallenge() {
    Get.to(() => const ChallengeListScreen())?.then((value) {
      //onForeground();
    });
    playTap();
    // onBackground();
  }

  void onTapSetting() {
    Get.to(() => const SettingScreen())?.then((value) {
      // onForeground();
    });
    playTap();
    // onBackground();
  }
}
