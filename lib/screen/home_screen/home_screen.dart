import 'package:barubatu_3_app/model/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(HomeScreenController(), tag: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorStyle.backGroundColor,
      backgroundColor: CupertinoColors.secondarySystemGroupedBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    // color: ColorStyle.textColor,
                    color: CupertinoColors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              width: 280,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(25.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorStyle.white.withOpacity(0.6),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: controller.onTap,
                child: const Text(
                  '3人で対戦',
                  style: TextStyle(
                    fontSize: 25,
                    // color: ColorStyle.textColor,
                    color: CupertinoColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  // primary: ColorStyle.backGroundColor,
                  // onPrimary: ColorStyle.backGroundColor,
                  primary: Colors.grey.shade100,
                  onPrimary: Colors.grey.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: 280,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                boxShadow: [
                  BoxShadow(
                    color: ColorStyle.white.withOpacity(0.6),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: controller.onTapSetting,
                child: const Text(
                  '設定画面',
                  style: TextStyle(
                    fontSize: 25,
                    // color: ColorStyle.textColor,
                    color: CupertinoColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  // primary: ColorStyle.backGroundColor,
                  // onPrimary: ColorStyle.backGroundColor,
                  primary: Colors.grey.shade100,
                  onPrimary: Colors.grey.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
