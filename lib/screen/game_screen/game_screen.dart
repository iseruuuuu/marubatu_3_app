// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:barubatu_3_app/admob/ad_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import 'package:barubatu_3_app/model/color.dart';
import 'package:barubatu_3_app/model/model.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  //まる　　  1 = true, 　　  2 = false,　　  3 = false,
  //ばつ　　  1 = false,　　  2 = true,　　  3 = false,
  //四角　　  1 = false, 　　  2 = false,　　  3 = true,
  bool turnOfPlayer1 = true;
  bool turnOfPlayer2 = false;
  bool turnOfPlayer3 = false;
  List<PieceStatus> statusList = List.filled(25, PieceStatus.none);
  GameStatus gameStatus = GameStatus.play;
  List<Widget> buildLine = [Container()];
  double lineThickness = 5.0;
  late double lineWidth;
  static const tapSound = 'images/game_tap.mp3';
  static const gameClear = 'images/game_clear.mp3';
  final AudioCache _cache = AudioCache(fixedPlayer: AudioPlayer());

  // static const backgroundMusic = 'images/game_bgm.mp3';
  AudioPlayer? _player;
  final List<List<int>> settlementListHorizontal = [
    [0, 1, 2],
    [1, 2, 3],
    [2, 3, 4],
    [5, 6, 7],
    [6, 7, 8],
    [7, 8, 9],
    [10, 11, 12],
    [11, 12, 13],
    [12, 13, 14],
    [15, 16, 17],
    [16, 17, 18],
    [17, 18, 19],
    [20, 21, 22],
    [21, 22, 23],
    [22, 23, 24],
  ];

  final List<List<int>> settlementListVertical = [
    //縦の勝ち方
    [0, 5, 10],
    [5, 10, 15],
    [10, 15, 20],

    [1, 6, 11],
    [6, 11, 16],
    [11, 16, 21],

    [2, 7, 12],
    [7, 12, 17],
    [12, 17, 22],

    [3, 8, 13],
    [8, 13, 18],
    [13, 18, 23],

    [4, 9, 14],
    [9, 14, 19],
    [14, 19, 24],
  ];
  final List<List<int>> settlementListDiagonal = [
    //斜めの勝ち方
    [0, 6, 12],
    [1, 7, 13],
    [2, 8, 14],

    [5, 11, 17],
    [6, 12, 18],
    [7, 13, 19],

    [10, 16, 22],
    [11, 17, 23],
    [12, 18, 24],

    [2, 6, 10],
    [3, 7, 11],
    [4, 8, 12],

    [7, 11, 15],
    [8, 12, 16],
    [9, 13, 17],

    [12, 16, 20],
    [13, 17, 21],
    [14, 18, 22],
  ];

  late BannerAd banner;

  @override
  void initState() {
    super.initState();
    // bgmPlayer(name: backgroundMusic);
    loadSound();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadAd();
  }

  void loadAd() {
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId,
          size: AdSize.banner,
          request: const AdRequest(),
          listener: adState.adListener,
        )..load();
      });
    });
  }

  // void bgmPlayer({required String name, bool isLoop = true}) {
  //       () async {
  //     await _player?.stop();
  //     await _player?.dispose();
  //     if (isLoop) {
  //       _player = await _cache.loop(name, mode: PlayerMode.MEDIA_PLAYER);
  //     } else {
  //       _player = await _cache.play(name, mode: PlayerMode.MEDIA_PLAYER);
  //     }
  //   }();
  // }

  void stopBgm() async {
    await _player?.stop();
  }

  Future<void> disposeBgm() async {
    return await _player?.dispose();
  }

  @override
  void dispose() {
    super.dispose();
    stopBgm();
  }

  void loadSound() async {
    _cache.load(tapSound);
  }

  void playSound() async {
    _cache.play(tapSound);
  }

  void clear() {
    setState(() {
      turnOfPlayer1 = true;
      turnOfPlayer2 = false;
      turnOfPlayer3 = false;
      statusList = List.filled(25, PieceStatus.none);
      gameStatus = GameStatus.play;
      buildLine = [Container()];
    });
  }

  void onTapImageDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Center(
            child: Text(
              '勝ち手一覧',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          content: Image.asset(
            'assets/images/dialog.png',
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    lineWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        backgroundColor: CupertinoColors.white,
        elevation: 0,
        title: TextButton(
          onPressed: () {
            clear();
          },
          child: const Text(
            'リセット',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            iconSize: 45,
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.blueAccent,
              size: 35,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          TextButton(
            child: const Text(
              '?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            onPressed: onTapImageDialog,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Center(
            child: buildRow(),
          ),
          buildColumn(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: AdWidget(
              ad: banner,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow() {
    switch (gameStatus) {
      case GameStatus.play:
        return Material(
          elevation: 10,
          child: Container(
            width: MediaQuery.of(context).size.width - 50,
            height: 90.w,
            decoration: BoxDecoration(
              border: Border.all(
                width: 3,
                color: Colors.grey.shade700,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                turnOfPlayer1
                    ? const Icon(
                        FontAwesomeIcons.circle,
                        size: 60,
                        color: ColorStyle.blue,
                      )
                    : const Icon(
                        FontAwesomeIcons.circle,
                        size: 60,
                        color: Colors.grey,
                      ),
                turnOfPlayer2
                    ? const Icon(
                        Icons.clear,
                        size: 80,
                        color: ColorStyle.red,
                      )
                    : const Icon(
                        Icons.clear,
                        size: 80,
                        color: Colors.grey,
                      ),
                turnOfPlayer3
                    ? const Icon(
                        FontAwesomeIcons.square,
                        color: ColorStyle.green,
                        size: 60,
                      )
                    : const Icon(
                        FontAwesomeIcons.square,
                        color: Colors.grey,
                        size: 60,
                      ),
              ],
            ),
          ),
        );
      case GameStatus.draw:
        return Material(
          elevation: 10,
          child: Container(
            width: MediaQuery.of(context).size.width - 50,
            height: 90.w,
            decoration: BoxDecoration(
              border: Border.all(
                width: 3,
                color: Colors.grey.shade700,
              ),
            ),
            child: Center(
              child: Text(
                "引き分けです",
                style: TextStyle(fontSize: 30.w),
              ),
            ),
          ),
        );
      case GameStatus.settlement:
        return Material(
          elevation: 10,
          child: Container(
            width: MediaQuery.of(context).size.width - 50,
            height: 90.w,
            decoration: BoxDecoration(
              border: Border.all(
                width: 3,
                color: Colors.grey.shade700,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                turnOfPlayer2
                    ? Icon(
                        FontAwesomeIcons.circle,
                        size: 50.w,
                        color: ColorStyle.blue,
                      )
                    : Container(),
                turnOfPlayer3
                    ? const Icon(
                        Icons.clear,
                        size: 70,
                        color: ColorStyle.red,
                      )
                    : Container(),
                turnOfPlayer1
                    ? const Icon(
                        FontAwesomeIcons.square,
                        color: ColorStyle.green,
                        size: 50,
                      )
                    : Container(),
                Text("の勝利", style: TextStyle(fontSize: 45.w)),
              ],
            ),
          ),
        );
      default:
        return Container();
    }
  }

  Widget buildColumn() {
    List<Widget> _columnChildren = [
      const Divider(
        height: 0.0,
        thickness: 2,
        color: ColorStyle.black,
      ),
    ];
    List<Widget> _rowChildren = [];
    for (int j = 0; j < 5; j++) {
      //横の行を作成するもの
      for (int i = 0; i < 5; i++) {
        int _index = j * 5 + i;
        _rowChildren.add(
          Expanded(
            child: InkWell(
              onTap: gameStatus == GameStatus.play
                  ? () {
                      if (statusList[_index] == PieceStatus.none) {
                        if (turnOfPlayer1 == true) {
                          statusList[_index] = PieceStatus.circle;
                          turnOfPlayer1 = false;
                          turnOfPlayer2 = true;
                          turnOfPlayer3 = false;
                          confirmResult();
                        } else if (turnOfPlayer2 == true) {
                          statusList[_index] = PieceStatus.cross;
                          turnOfPlayer1 = false;
                          turnOfPlayer2 = false;
                          turnOfPlayer3 = true;
                          confirmResult();
                        } else if (turnOfPlayer3 == true) {
                          statusList[_index] = PieceStatus.square;
                          turnOfPlayer1 = true;
                          turnOfPlayer2 = false;
                          turnOfPlayer3 = false;
                          confirmResult();
                        }
                      }
                      setState(() {});
                    }
                  : null,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Row(
                  children: [
                    Expanded(child: build1(statusList[_index])),
                    (i == 4)
                        ? Container()
                        : const VerticalDivider(
                            width: 0.0,
                            thickness: 2,
                            color: ColorStyle.black,
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
      _columnChildren.add(Row(children: _rowChildren));
      _columnChildren.add(
        const Divider(
          height: 0.0,
          thickness: 2,
          color: ColorStyle.black,
        ),
      );
      _rowChildren = [];
    }
    return Stack(
      children: [
        Column(children: _columnChildren),
        Stack(children: buildLine),
      ],
    );
  }

  Container build1(PieceStatus pieceStatus) {
    switch (pieceStatus) {
      case PieceStatus.none:
        return Container();
      case PieceStatus.circle:
        return Container(
          child: const Icon(
            FontAwesomeIcons.circle,
            size: 60,
            color: ColorStyle.blue,
          ),
        );
      case PieceStatus.cross:
        return Container(
          child: const Icon(
            Icons.clear,
            size: 75,
            color: ColorStyle.red,
          ),
        );
      case PieceStatus.square:
        return Container(
          child: const Icon(
            FontAwesomeIcons.square,
            size: 60,
            color: ColorStyle.green,
          ),
        );
      default:
        return Container();
    }
  }

  void confirmResult() {
    playSound();
    if (!statusList.contains(PieceStatus.none)) {
      gameStatus = GameStatus.draw;
      openWinningDialog(false);
    }
    //行における勝敗のパターン
    for (int i = 0; i < settlementListHorizontal.length; i++) {
      if (statusList[settlementListHorizontal[i][0]] ==
              statusList[settlementListHorizontal[i][1]] &&
          statusList[settlementListHorizontal[i][1]] ==
              statusList[settlementListHorizontal[i][2]] &&
          statusList[settlementListHorizontal[i][0]] != PieceStatus.none) {
        buildLine.add(
          Container(
            margin: EdgeInsets.only(
              top: lineWidth / 3 * i + lineWidth / 6 - lineThickness / 2,
            ),
          ),
        );
        gameStatus = GameStatus.settlement;
        openWinningDialog(true);
      }
    }
    //行における勝敗のパターン
    for (int i = 0; i < settlementListVertical.length; i++) {
      if (statusList[settlementListVertical[i][0]] ==
              statusList[settlementListVertical[i][1]] &&
          statusList[settlementListVertical[i][1]] ==
              statusList[settlementListVertical[i][2]] &&
          statusList[settlementListVertical[i][0]] != PieceStatus.none) {
        buildLine.add(
          Container(
            margin: EdgeInsets.only(
              left: lineWidth / 3 * i + lineWidth / 6 - lineThickness / 2,
            ),
          ),
        );
        gameStatus = GameStatus.settlement;
        openWinningDialog(true);
      }
    }
    //斜めにおける勝敗パターン
    for (int i = 0; i < settlementListDiagonal.length; i++) {
      if (statusList[settlementListDiagonal[i][0]] ==
              statusList[settlementListDiagonal[i][1]] &&
          statusList[settlementListDiagonal[i][1]] ==
              statusList[settlementListDiagonal[i][2]] &&
          statusList[settlementListDiagonal[i][0]] != PieceStatus.none) {
        buildLine.add(
          Transform.rotate(
            alignment: i == 0 ? Alignment.topLeft : Alignment.topRight,
            angle: i == 0 ? -pi / 4 : pi / 4,
            child: Container(
              width: lineThickness,
              margin: EdgeInsets.only(
                left: i == 0 ? 0.0 : lineWidth - lineThickness,
              ),
            ),
          ),
        );
        gameStatus = GameStatus.settlement;
        openWinningDialog(true);
      }
    }
  }

  void playClearSound() {
    _cache.play(gameClear);
  }

  void openWinningDialog(bool isWin) {
    playClearSound();
    String whoWin = '';
    if (isWin) {
      if (turnOfPlayer1) {
        whoWin = '□の勝ち';
      } else if (turnOfPlayer2) {
        whoWin = '◯の勝ち';
      } else if (turnOfPlayer3) {
        whoWin = '×の勝ち';
      }
    } else {
      whoWin = '引き分け';
    }
    AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO_REVERSED,
      barrierColor: Colors.grey.shade100,
      dismissOnTouchOutside: true,
      animType: AnimType.SCALE,
      title: whoWin,
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.black,
      ),
      btnOkText: 'もう一度',
      btnCancelText: 'タイトル',
      btnCancelOnPress: () {
        Navigator.pop(context);
      },
      btnOkOnPress: () {
        clear();
      },
    ).show();
  }
}
