import 'package:barubatu_3_app/model/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.backGroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  FontAwesomeIcons.circle,
                  size: 40,
                  color: ColorStyle.blue,
                ),
                Icon(
                  Icons.clear,
                  size: 50,
                  color: ColorStyle.red,
                ),
                Icon(
                  FontAwesomeIcons.square,
                  size: 40,
                  color: ColorStyle.green,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'ゲーム',
                  style: TextStyle(
                    fontSize: 40,
                    color: ColorStyle.textColor,
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GameScreen()),
                  );
                },
                child: const Text(
                  '3人で対戦',
                  style: TextStyle(
                    fontSize: 25,
                    color: ColorStyle.textColor,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: ColorStyle.backGroundColor,
                  onPrimary: ColorStyle.backGroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
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
