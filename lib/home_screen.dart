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
            const Text('4×4', style: TextStyle(fontSize: 50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(FontAwesomeIcons.circle,
                  size: 40,
                  color: Colors.blue,
                ),
                Icon(Icons.clear, size: 45, color: Colors.red),
                Text('ゲーム', style: TextStyle(fontSize: 40)),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 280,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                },
                child: const Text(
                  '友達と対戦',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 280,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=> const CPUHomePage(),
                    ),
                  );
                },
                child: const Text(
                  'CPUと対戦',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Dialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          title: const Text(
            '現在開発中！',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          content: const Text(
            '',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
          actions: [
            const Divider(
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'いいえ',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
    return Dialog();
  }

  void action() {
    Navigator.pop(context);
  }
}

/*TODO 　現在使われているやつ！
 showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Center(
                          child: Text(
                            "現在開発中",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        content: const Text(
                          "少々お待ちください",
                          style: TextStyle(fontSize: 20),
                        ),
                        actions: <Widget>[
                          // ボタン領域
                          const Spacer(),
                          Center(
                            child: TextButton(
                              child: const Text(
                                "閉じる",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                ),
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ],
                      );
                    },
                  );
 */













//Navigator.push(context, MaterialPageRoute(builder: (context) => CPUPage()));

/*
return AlertDialog(
                        title: Center(child: Text("注意!!", style: TextStyle(
                            fontSize: 30),)),
                        content: Text("相手は頭の悪いCPUです。\n""理不尽に❌をつけてきます。\n勝てるかどうかはあなたの実力と運です。",
                          style: TextStyle(fontSize: 20),),
                        actions: <Widget>[
                          // ボタン領域
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(),
                              Center(
                                child: FlatButton(
                                  child: const Text("閉じる", style: TextStyle(color: Colors.red,fontSize: 20)),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ),
                              Spacer(),
                              Center(
                                child: FlatButton(
                                  child: const Text("チャレンジする", style: TextStyle(color: Colors.blue,fontSize: 20),),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => CPUHomePage(title: '')));
                                  },
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ],
                      );
 */
