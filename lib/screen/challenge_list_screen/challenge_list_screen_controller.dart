// Flutter imports:
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:barubatu_3_app/preference/shared_preference.dart';
import 'package:barubatu_3_app/screen/challenge_screen/challenge_screen_1.dart';
import 'package:barubatu_3_app/screen/challenge_screen/challenge_screen_2.dart';
import 'package:barubatu_3_app/screen/challenge_screen/challenge_screen_3.dart';
import 'package:barubatu_3_app/screen/challenge_screen/challenge_screen_4.dart';
import 'package:barubatu_3_app/screen/challenge_screen/challenge_screen_5.dart';
import 'package:barubatu_3_app/screen/trophy_screen/trophy_screen.dart';

class ChallengeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin, WidgetsBindingObserver, RouteAware {
  var stage1 = false.obs;
  var stage2 = false.obs;
  var stage3 = false.obs;
  var stage4 = false.obs;
  var stage5 = false.obs;

  late AnimationController animationController;

  // static const bgm = 'images/background.mp3';
  // final AudioCache bgmCache = AudioCache(fixedPlayer: AudioPlayer());
  // AudioPlayer? bgmPlayer;

  static const tap = 'images/tap.mp3';
  final AudioCache tapCache = AudioCache(fixedPlayer: AudioPlayer());
  AudioPlayer? tapPlayer;

  @override
  void onInit() {
    super.onInit();
    sharedPreference();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    )..repeat(reverse: true);
    // loadBgm(name: bgm);
    loadTap();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    animationController.dispose();
    // onBackground();
    super.dispose();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.resumed) {
  //     onForeground();
  //   } else if (state == AppLifecycleState.paused) {
  //     onBackground();
  //   }
  // }

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

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void onTapBack() {
    Get.back();
    // onBackground();
  }

  Future<void> sharedPreference() async {
    stage1.value = await Preference().getBool(PreferenceKey.stage1);
    stage2.value = await Preference().getBool(PreferenceKey.stage2);
    stage3.value = await Preference().getBool(PreferenceKey.stage3);
    stage4.value = await Preference().getBool(PreferenceKey.stage4);
    stage5.value = await Preference().getBool(PreferenceKey.stage5);
  }

  void onTapLevel1() {
    Get.to(() => const ChallengeScreen1())?.then((value) {
      // onForeground();
    });
    // onBackground();
    playTap();
  }

  void onTapLevel2() {
    Get.to(() => const ChallengeScreen2())?.then((value) {
      // onForeground();
    });
    // onBackground();
    playTap();
  }

  void onTapLevel3() {
    Get.to(() => const ChallengeScreen3())?.then((value) {
      // onForeground();
    });
    // onBackground();
    playTap();
  }

  void onTapLevel4() {
    Get.to(() => const ChallengeScreen4())?.then((value) {
      // onForeground();
    });
    // onBackground();
    playTap();
  }

  void onTapLevel5() {
    Get.to(() => const ChallengeScreen5())?.then((value) {
      // onForeground();
    });
    // onBackground();
    playTap();
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
    )?.then((value) {
      // onForeground();
    });
    // onBackground();
    playTap();
  }
}
