import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:barubatu_3_app/preference/shared_preference.dart';

class ChallengeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin, WidgetsBindingObserver, RouteAware {
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
      duration: const Duration(
        seconds: 1,
      ),
    )..repeat(reverse: true);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    animationController.dispose();
    // onBackground();
    super.dispose();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
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
}
