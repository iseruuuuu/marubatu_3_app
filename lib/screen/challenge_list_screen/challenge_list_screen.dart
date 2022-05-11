import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../home_screen/children/button_item.dart';
import 'challenge_list_screen_controller.dart';

class ChallengeListScreen extends StatelessWidget {
  const ChallengeListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChallengeScreenController(), tag: '');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          iconSize: 35.w,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blueAccent,
          ),
          onPressed: controller.onTapBack,
        ),
        actions: [
          IconButton(
            onPressed: controller.onTapTrophyScreen,
            iconSize: 40.w,
            icon: const Icon(
              Icons.flag,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ScaleTransition(
              scale: controller.animationController.drive(
                Tween<double>(
                  begin: 1,
                  end: 1.1,
                ),
              ),
              child: ButtonItem(
                onPressed: controller.onTapLevel1,
                text: 'レベル１',
              ),
            ),
            ScaleTransition(
              scale: controller.animationController.drive(
                Tween<double>(
                  begin: 1,
                  end: 1.13,
                ),
              ),
              child: ButtonItem(
                onPressed: controller.onTapLevel2,
                text: 'レベル２',
              ),
            ),
            ScaleTransition(
              scale: controller.animationController.drive(
                Tween<double>(
                  begin: 1,
                  end: 1.15,
                ),
              ),
              child: ButtonItem(
                onPressed: controller.onTapLevel3,
                text: 'レベル３',
              ),
            ),
            ScaleTransition(
              scale: controller.animationController.drive(
                Tween<double>(
                  begin: 1,
                  end: 1.17,
                ),
              ),
              child: ButtonItem(
                onPressed: controller.onTapLevel4,
                text: 'レベル４',
              ),
            ),
            ScaleTransition(
              scale: controller.animationController.drive(
                Tween<double>(
                  begin: 1,
                  end: 1.2,
                ),
              ),
              child: ButtonItem(
                onPressed: controller.onTapLevel5,
                text: 'レベル５',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
