import 'package:barubatu_3_app/screen/challenge_screen/challenge_screen_3.dart';
import 'package:barubatu_3_app/screen/trophy_screen/trophy_screen.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import '../../preference/shared_preference.dart';
import '../challenge_screen/challenge_screen_1.dart';
import '../challenge_screen/challenge_screen_2.dart';
import '../challenge_screen/challenge_screen_4.dart';
import '../challenge_screen/challenge_screen_5.dart';
import 'package:audioplayers/audioplayers.dart';

class ChallengeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var stage1 = false.obs;
  var stage2 = false.obs;
  var stage3 = false.obs;
  var stage4 = false.obs;
  var stage5 = false.obs;

  late AnimationController animationController;

  static const tapSound = 'images/tap.mp3';
  static const backgroundMusic = 'images/background.mp3';
  final AudioCache _cache = AudioCache(fixedPlayer: AudioPlayer());
  AudioPlayer? _player;

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
    bgmPlayer(name: backgroundMusic);
    loadSound();
  }

  void bgmPlayer({required String name, bool isLoop = true}) {
    () async {
      await _player?.stop();
      await _player?.dispose();
      if (isLoop) {
        _player = await _cache.loop(name, mode: PlayerMode.MEDIA_PLAYER);
      } else {
        _player = await _cache.play(name, mode: PlayerMode.MEDIA_PLAYER);
      }
    }();
  }

  void loadSound() async {
    _cache.load(tapSound);
  }

  void playSound() async {
    _cache.play(tapSound);
  }

  void stopSound() {
    _cache.clearAll();
  }

  void stopBgm() async {
    await _player?.stop();
  }

  Future<void> disposeBgm() async {
    return await _player?.dispose();
  }

  @override
  void dispose() {
    super.dispose();
    stopBgm();
    animationController.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
  }

  void onTapBack() {
    Get.back();
    stopSound();
    stopBgm();
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
    playSound();
    stopSound();
  }

  void onTapLevel2() {
    Get.to(() => const ChallengeScreen2());
    playSound();
    stopBgm();
  }

  void onTapLevel3() {
    Get.to(() => const ChallengeScreen3());
    playSound();
    stopBgm();
  }

  void onTapLevel4() {
    Get.to(() => const ChallengeScreen4());
    playSound();
    stopBgm();
  }

  void onTapLevel5() {
    Get.to(() => const ChallengeScreen5());
    playSound();
    stopBgm();
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
    playSound();
    stopBgm();
  }
}
