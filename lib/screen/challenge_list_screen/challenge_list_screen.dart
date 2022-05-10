import 'package:barubatu_3_app/screen/challenge_list_screen/children/button_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
            ButtonItem(
              onPressed: controller.onTapLevel1,
              text: 'レベル１',
            ),
            ButtonItem(
              onPressed: controller.onTapLevel2,
              text: 'レベル２',
            ),
            ButtonItem(
              onPressed: controller.onTapLevel3,
              text: 'レベル３',
            ),
            ButtonItem(
              onPressed: controller.onTapLevel4,
              text: 'レベル４',
            ),
            ButtonItem(
              onPressed: controller.onTapLevel5,
              text: 'レベル５',
            ),
          ],
        ),
      ),
    );
  }
}
