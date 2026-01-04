import 'dart:math';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:barubatu_3_app/model/model.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

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

  // BGMは使用しません
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
  @override
  void initState() {
    super.initState();
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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black.withValues(alpha: 0.25),
        elevation: 0,
        title: TextButton(
          onPressed: () {
            clear();
          },
          child: Text(
            'リセット',
            style: TextStyle(
              color: Color(0xFF00FFA3),
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
              color: Color(0xFF00FFA3),
              size: 35,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: onTapImageDialog,
            child: Text(
              '?',
              style: TextStyle(
                fontSize: 32,
                color: Color(0xFF00FFA3),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/home/background.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Center(child: buildRow()),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: buildColumn(),
                ),
              ],
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
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 20,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFF0F172A),
                  border: Border.all(width: 3, color: const Color(0xFFFFFFFF)),
                  borderRadius: BorderRadius.zero,
                ),
              ),
              // 内側ハイライト
              Positioned(
                left: 8,
                right: 8,
                top: 6,
                child: Container(
                  height: 14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withValues(alpha: 0.06),
                        Colors.white.withValues(alpha: 0.0),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    turnOfPlayer1
                        ? const Icon(
                            FontAwesomeIcons.circle,
                            size: 60,
                            color: Colors.blue,
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
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.clear,
                            size: 80,
                            color: Colors.grey,
                          ),
                    turnOfPlayer3
                        ? const Icon(
                            FontAwesomeIcons.square,
                            color: Colors.green,
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
            ],
          ),
        );
      case GameStatus.draw:
        return Material(
          elevation: 10,
          child: Container(
            width: MediaQuery.of(context).size.width - 50,
            height: 90.w,
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A),
              border: Border.all(width: 3, color: const Color(0xFF5FEAD1)),
            ),
            child: Center(
              child: Text(
                '引き分けです',
                style: GoogleFonts.dotGothic16(
                  fontSize: 24.w,
                  color: const Color(0xFF5FEAD1),
                  letterSpacing: 1.0,
                ),
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
              color: const Color(0xFF0F172A),
              border: Border.all(width: 3, color: const Color(0xFF5FEAD1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                turnOfPlayer2
                    ? Icon(
                        FontAwesomeIcons.circle,
                        size: 50.w,
                        color: const Color(0xFF4FDFFF),
                      )
                    : Container(),
                turnOfPlayer3
                    ? const Icon(
                        Icons.clear,
                        size: 70,
                        color: Color(0xFFFF6B6B),
                      )
                    : Container(),
                turnOfPlayer1
                    ? const Icon(
                        FontAwesomeIcons.square,
                        color: Color(0xFF6EE7B7),
                        size: 50,
                      )
                    : Container(),
                const SizedBox(width: 8),
                Text(
                  'の勝利',
                  style: GoogleFonts.dotGothic16(
                    fontSize: 26.w,
                    color: const Color(0xFF5FEAD1),
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }

  Widget buildColumn() {
    List<Widget> columnChildren = [
      const Divider(
        height: 0.0,
        thickness: 4,
        color: Color(0xFFFFFFFF),
      )
    ];
    List<Widget> rowChildren = [];
    for (int j = 0; j < 5; j++) {
      //横の行を作成するもの
      for (int i = 0; i < 5; i++) {
        int index = j * 5 + i;
        rowChildren.add(
          Expanded(
            child: InkWell(
              onTap: gameStatus == GameStatus.play
                  ? () {
                      if (statusList[index] == PieceStatus.none) {
                        if (turnOfPlayer1 == true) {
                          statusList[index] = PieceStatus.circle;
                          turnOfPlayer1 = false;
                          turnOfPlayer2 = true;
                          turnOfPlayer3 = false;
                          confirmResult();
                        } else if (turnOfPlayer2 == true) {
                          statusList[index] = PieceStatus.cross;
                          turnOfPlayer1 = false;
                          turnOfPlayer2 = false;
                          turnOfPlayer3 = true;
                          confirmResult();
                        } else if (turnOfPlayer3 == true) {
                          statusList[index] = PieceStatus.square;
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
                    Expanded(child: build1(statusList[index])),
                    (i == 4)
                        ? Container()
                        : const VerticalDivider(
                            width: 0.0,
                            thickness: 4,
                            color: Color(0xFFFFFFFF),
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
      columnChildren.add(Row(children: rowChildren));
      columnChildren.add(
        const Divider(
          height: 0.0,
          thickness: 4,
          color: Color(0xFFFFFFFF),
        ),
      );
      rowChildren = [];
    }
    return Stack(
      children: [
        // 盤面の暗めオーバーレイ
        Positioned.fill(
          child: Container(color: const Color(0x990F172A)),
        ),
        Column(children: columnChildren),
        // 左右端の縦ライン（外枠）
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: Container(width: 6, color: const Color(0xFFFFFFFF)),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Container(width: 6, color: const Color(0xFFFFFFFF)),
        ),
        // 既存の勝敗ライン
        Stack(children: buildLine),
      ],
    );
  }

  Container build1(PieceStatus pieceStatus) {
    switch (pieceStatus) {
      case PieceStatus.none:
        return Container(
          alignment: Alignment.center,
          child: gameStatus == GameStatus.play
              ? Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                )
              : null,
        );
      case PieceStatus.circle:
        return Container(
          child: const Icon(
            FontAwesomeIcons.circle,
            size: 60,
            color: Color(0xFF4FDFFF),
          ),
        );
      case PieceStatus.cross:
        return Container(
          child: const Icon(
            Icons.clear,
            size: 75,
            color: Color(0xFFFF6B6B),
          ),
        );
      case PieceStatus.square:
        return Container(
          child: const Icon(
            FontAwesomeIcons.square,
            size: 60,
            color: Color(0xFF6EE7B7),
          ),
        );
    }
  }

  void confirmResult() {
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

  void openWinningDialog(bool isWin) {
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
      dialogType: DialogType.infoReverse,
      barrierColor: Colors.grey.shade100,
      dismissOnTouchOutside: true,
      animType: AnimType.scale,
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
