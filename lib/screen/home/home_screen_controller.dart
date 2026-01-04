import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin, WidgetsBindingObserver, RouteAware {
  late AnimationController animationController;

  @override
  void onInit() {
    super.onInit();
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
}
