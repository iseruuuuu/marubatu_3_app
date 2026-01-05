import 'package:barubatu_3_app/ui/screen/game/game_screen_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:barubatu_3_app/ui/components/app_dialog.dart';
import 'package:barubatu_3_app/model/model.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final GameScreenControler c;
  List<Widget> buildLine = [Container()];
  double lineThickness = 1.0;
  late double lineWidth;

  @override
  void initState() {
    super.initState();
    c = GameScreenControler();
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
            setState(() {
              c.clear();
              buildLine = [Container()];
            });
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
            onPressed: () => Navigator.pop(context),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => c.onTapImageDialog(context),
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
                Center(
                  child: () {
                    switch (c.gameStatus) {
                      case GameStatus.play:
                        return Material(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 20,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0F172A),
                                  border: Border.all(
                                    width: 3,
                                    color: Color(0xFF00FFA3),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF00FFA3)
                                          .withValues(alpha: 0.35),
                                      blurRadius: 24,
                                      spreadRadius: 2,
                                    ),
                                    BoxShadow(
                                      color: const Color(0xFF00FFA3)
                                          .withValues(alpha: 0.15),
                                      blurRadius: 48,
                                      spreadRadius: 10,
                                    ),
                                  ],
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    c.turnOfPlayer1
                                        ? const Icon(
                                            FontAwesomeIcons.circle,
                                            size: 70,
                                            color: Colors.blue,
                                          )
                                        : const Icon(
                                            FontAwesomeIcons.circle,
                                            size: 70,
                                            color: Colors.grey,
                                          ),
                                    c.turnOfPlayer2
                                        ? const Icon(
                                            Icons.clear,
                                            size: 90,
                                            color: Colors.red,
                                          )
                                        : const Icon(
                                            Icons.clear,
                                            size: 90,
                                            color: Colors.grey,
                                          ),
                                    c.turnOfPlayer3
                                        ? const Icon(
                                            FontAwesomeIcons.square,
                                            color: Color(0xFF00FFA3),
                                            size: 70,
                                          )
                                        : const Icon(
                                            FontAwesomeIcons.square,
                                            color: Colors.grey,
                                            size: 70,
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 50,
                            height: 90.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0F172A),
                              border: Border.all(
                                  width: 3, color: const Color(0xFF5FEAD1)),
                              borderRadius: BorderRadius.circular(12),
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            width: MediaQuery.of(context).size.width - 50,
                            height: 90.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0F172A),
                              border: Border.all(
                                  width: 3, color: const Color(0xFF5FEAD1)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                c.turnOfPlayer2
                                    ? Icon(
                                        FontAwesomeIcons.circle,
                                        size: 50.w,
                                        color: const Color(0xFF4FDFFF),
                                      )
                                    : Container(),
                                c.turnOfPlayer3
                                    ? const Icon(
                                        Icons.clear,
                                        size: 70,
                                        color: Color(0xFFFF6B6B),
                                      )
                                    : Container(),
                                c.turnOfPlayer1
                                    ? const Icon(
                                        FontAwesomeIcons.square,
                                        color: Color(0xFF00FFA3),
                                        size: 50,
                                      )
                                    : Container(),
                                const SizedBox(width: 8),
                                Text(
                                  'の勝利',
                                  style: GoogleFonts.dotGothic16(
                                    fontSize: 36,
                                    color: const Color(0xFF5FEAD1),
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                    }
                  }(),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: () {
                    List<Widget> columnChildren = [
                      Divider(
                        height: 0.0,
                        thickness: lineThickness,
                        color: Color(0xFFFFFFFF),
                      )
                    ];
                    List<Widget> rowChildren = [];
                    for (int j = 0; j < 5; j++) {
                      for (int i = 0; i < 5; i++) {
                        int index = j * 5 + i;
                        rowChildren.add(
                          Expanded(
                            child: InkWell(
                              onTap: c.gameStatus == GameStatus.play
                                  ? () {
                                      setState(() {
                                        c.handleTap(index);
                                        if (c.gameStatus == GameStatus.draw) {
                                          openWinningDialog(false);
                                        } else if (c.gameStatus ==
                                            GameStatus.settlement) {
                                          openWinningDialog(true);
                                        }
                                      });
                                    }
                                  : null,
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: () {
                                        final pieceStatus = c.statusList[index];
                                        switch (pieceStatus) {
                                          case PieceStatus.none:
                                            return Container(
                                              alignment: Alignment.center,
                                              child: c.gameStatus ==
                                                      GameStatus.play
                                                  ? Container(
                                                      width: 6,
                                                      height: 6,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withValues(
                                                                alpha: 0.15),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    )
                                                  : null,
                                            );
                                          case PieceStatus.circle:
                                            return const Icon(
                                              FontAwesomeIcons.circle,
                                              size: 56,
                                              color: Color(0xFF4FDFFF),
                                            );
                                          case PieceStatus.cross:
                                            return const Icon(
                                              Icons.clear,
                                              size: 72,
                                              color: Color(0xFFFF6B6B),
                                            );
                                          case PieceStatus.square:
                                            return const Icon(
                                              FontAwesomeIcons.square,
                                              size: 56,
                                              color: Color(0xFF6EE7B7),
                                            );
                                        }
                                      }(),
                                    ),
                                    (i == 4)
                                        ? Container()
                                        : VerticalDivider(
                                            width: 0.0,
                                            thickness: lineThickness,
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
                        Divider(
                          height: 0.0,
                          thickness: lineThickness,
                          color: Color(0xFFFFFFFF),
                        ),
                      );
                      rowChildren = [];
                    }
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: Container(color: const Color(0x990F172A)),
                        ),
                        Column(children: columnChildren),
                        Positioned(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: lineThickness,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: lineThickness,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                        Stack(children: buildLine),
                      ],
                    );
                  }(),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    'assets/images/circle.png',
                    width: 180,
                    height: 100,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void openWinningDialog(bool isWin) {
    String whoWin = '';
    if (isWin) {
      if (c.turnOfPlayer1) {
        whoWin = '□の勝ち';
      } else if (c.turnOfPlayer2) {
        whoWin = '◯の勝ち';
      } else if (c.turnOfPlayer3) {
        whoWin = '×の勝ち';
      }
    } else {
      whoWin = '引き分け';
    }
    AppDialog.showWinDialog(
      context,
      title: whoWin,
      onCancel: () {
        Navigator.pop(context);
      },
      onOk: () {
        setState(() {
          c.clear();
          buildLine = [Container()];
        });
      },
    );
  }
}
