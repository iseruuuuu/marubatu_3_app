import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:barubatu_3_app/model/color.dart';
import 'children/button_item.dart';
import 'home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(HomeScreenController(), tag: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(FontAwesomeIcons.circle, size: 50, color: ColorStyle.blue),
                Icon(Icons.clear, size: 60, color: ColorStyle.red),
                Icon(FontAwesomeIcons.square,
                    size: 50, color: ColorStyle.green),
                SizedBox(width: 10),
                Text(
                  'ゲーム',
                  style: TextStyle(
                    fontSize: 45,
                    color: CupertinoColors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            ScaleTransition(
              scale: controller.animationController.drive(
                Tween<double>(
                  begin: 1,
                  end: 1.08,
                ),
              ),
              child: ButtonItem(
                onPressed: controller.onTap,
                text: '3人で対戦',
              ),
            ),
            const SizedBox(height: 50),
            ScaleTransition(
              scale: controller.animationController.drive(
                Tween<double>(
                  begin: 1.08,
                  end: 1,
                ),
              ),
              child: ButtonItem(
                onPressed: controller.onTapChallenge,
                text: 'チャレンジモード',
              ),
            ),
            const SizedBox(height: 50),
            ScaleTransition(
              scale: controller.animationController.drive(
                Tween<double>(
                  begin: 1,
                  end: 1.08,
                ),
              ),
              child: ButtonItem(
                onPressed: controller.onTapSetting,
                text: 'Setting',
              ),
            ),
            const Spacer(),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
