import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:barubatu_3_app/model/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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
            // DefaultTextStyle(
            //   style: const TextStyle(
            //     fontSize: 40.0,
            //     color: Colors.black,
            //   ),
            //   child: AnimatedTextKit(
            //     animatedTexts: [
            //       WavyAnimatedText('▲ ■ ● ゲーム'),
            //     ],
            //     repeatForever: true,
            //   ),
            // ),
            // SizedBox(
            //   width: 250.0,
            //   height: 50,
            //   child: DefaultTextStyle(
            //     style: const TextStyle(
            //       fontSize: 35,
            //       color: Colors.white,
            //       shadows: [
            //         Shadow(
            //           blurRadius: 7.0,
            //           color: Colors.white,
            //           offset: Offset(0, 0),
            //         ),
            //       ],
            //     ),
            //     child: AnimatedTextKit(
            //       repeatForever: true,
            //       isRepeatingAnimation: true,
            //       animatedTexts: [
            //         FlickerAnimatedText(
            //           '▲ ■ ● ゲーム',
            //           textStyle: const TextStyle(color: Colors.blue),
            //         ),
            //         FlickerAnimatedText(
            //           '▲ ■ ● ゲーム',
            //           textStyle: const TextStyle(color: Colors.red),
            //         ),
            //         FlickerAnimatedText(
            //           '▲ ■ ● ゲーム',
            //           textStyle: const TextStyle(color: Colors.green),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   width: 250.0,
            //   height: 50,
            //   child: DefaultTextStyle(
            //     style: const TextStyle(
            //       fontSize: 32.0,
            //       fontWeight: FontWeight.bold,
            //     ),
            //     child: Center(
            //       child: AnimatedTextKit(
            //         repeatForever: true,
            //         animatedTexts: [
            //           FadeAnimatedText('▲ ■ ● ゲーム',
            //               duration: const Duration(seconds: 2),
            //               textStyle: const TextStyle(color: Colors.blue),
            //               fadeOutBegin: 0.9,
            //               fadeInEnd: 0.7),
            //           FadeAnimatedText('▲ ■ ● ゲーム',
            //               duration: const Duration(seconds: 2),
            //               textStyle: const TextStyle(color: Colors.red),
            //               fadeOutBegin: 0.9,
            //               fadeInEnd: 0.7),
            //           FadeAnimatedText('▲ ■ ● ゲーム',
            //               duration: const Duration(seconds: 2),
            //               textStyle: const TextStyle(color: Colors.green),
            //               fadeOutBegin: 0.9,
            //               fadeInEnd: 0.7),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: 70,
            //   child: DefaultTextStyle(
            //     style: const TextStyle(
            //       fontSize: 50.0,
            //       fontFamily: 'SF',
            //     ),
            //     child: Center(
            //       child: AnimatedTextKit(
            //         repeatForever: true,
            //         animatedTexts: [
            //           ScaleAnimatedText(
            //             '▲ ■ ● ゲーム4',
            //             scalingFactor: 0.2,
            //             textStyle: const TextStyle(color: Colors.blue),
            //           ),
            //           ScaleAnimatedText(
            //             '▲ ■ ● ゲーム4',
            //             scalingFactor: 0.2,
            //             textStyle: const TextStyle(color: Colors.red),
            //           ),
            //           ScaleAnimatedText(
            //             '▲ ■ ● ゲーム4',
            //             scalingFactor: 0.2,
            //             textStyle: const TextStyle(color: Colors.green),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 60,
            //   child: DefaultTextStyle(
            //     style: const TextStyle(
            //       fontSize: 30.0,
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Center(
            //         child: AnimatedTextKit(
            //           repeatForever: true,
            //           animatedTexts: [
            //             TypewriterAnimatedText('▲ ■ ● ゲーム5',
            //                 textStyle: const TextStyle(color: Colors.blue),
            //                 curve: Curves.easeIn,
            //                 speed: const Duration(milliseconds: 80)),
            //             TypewriterAnimatedText('▲ ■ ● ゲーム5',
            //                 textStyle: const TextStyle(color: Colors.red),
            //                 curve: Curves.easeIn,
            //                 speed: const Duration(milliseconds: 80)),
            //             TypewriterAnimatedText('▲ ■ ● ゲーム5',
            //                 textStyle: const TextStyle(color: Colors.green),
            //                 curve: Curves.easeIn,
            //                 speed: const Duration(milliseconds: 80)),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 40),
            ScaleTransition(
              scale: controller.animationController.drive(
                Tween<double>(
                  begin: 1,
                  end: 1.13,
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
                  begin: 1,
                  end: 1.13,
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
                  end: 1.13,
                ),
              ),
              child: ButtonItem(
                onPressed: controller.onTapSetting,
                text: 'Setting',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
