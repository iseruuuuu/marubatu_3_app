import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0), // here the desired height
        child: AppBar(),
      ),
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
                  color: Colors.blue,
                ),
                Icon(Icons.clear, size: 50, color: Colors.red),
                Icon(
                  FontAwesomeIcons.square,
                  size: 40,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'ゲーム',
                  style: TextStyle(fontSize: 40),
                ),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 280,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                // onPressed: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => const MyHomePage()),
                //   );
                // },
                child: const Text(
                  '3人で対戦',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
