import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:barubatu_3_app/core/challenge/clear_style.dart';
import 'package:barubatu_3_app/core/game/game_turn_style.dart';
import 'package:barubatu_3_app/core/game/win_style.dart';
import 'package:barubatu_3_app/ui/components/app_dialog.dart';
import 'package:barubatu_3_app/model/model.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key, required this.id});
  final ChallengeId id;

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  late final ChallengeRule rule;
  bool turnOfPlayer1 = true;
  bool turnOfPlayer2 = false;
  bool turnOfPlayer3 = false;
  List<PieceStatus> statusList = List.filled(25, PieceStatus.none);
  GameStatus gameStatus = GameStatus.play;
  List<Widget> buildLine = [Container()];
  double lineThickness = 3.0;

  @override
  void initState() {
    super.initState();
    rule = ChallengeRules.byId[widget.id]!;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black.withValues(alpha: 0.25),
        elevation: 0,
        title: Text(
          rule.title,
          style: GoogleFonts.dotGothic16(
            color: const Color(0xFF00FFA3),
            fontSize: 22,
            letterSpacing: 1,
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
            onPressed: clear,
            child: const Text(
              'リセット',
              style: TextStyle(
                color: Color(0xFF00FFA3),
                fontSize: 18,
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
                // 説明
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF0B1220),
                          Color(0xFF0F172A),
                        ],
                      ),
                      border: Border.all(
                        color: const Color(0xFF00FFA3).withValues(alpha: 0.7),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:
                              const Color(0xFF00FFA3).withValues(alpha: 0.25),
                          blurRadius: 20,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color:
                              const Color(0xFF00FFA3).withValues(alpha: 0.10),
                          blurRadius: 40,
                          spreadRadius: 8,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          FontAwesomeIcons.flagCheckered,
                          color: Color(0xFF00FFA3),
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            rule.description,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mPlusRounded1c(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ステータスバー
                Center(
                  child: Material(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 20,
                          height: 110,
                          decoration: BoxDecoration(
                            color: const Color(0xFF0F172A),
                            border: Border.all(
                              width: 3,
                              color: const Color(0xFF00FFA3),
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF00FFA3)
                                    .withValues(alpha: 0.3),
                                blurRadius: 20,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 8,
                          right: 8,
                          top: 6,
                          child: Container(
                            height: 12,
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
                                      color: Color(0xFF00FFA3),
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
                  ),
                ),
                // 盤面
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: () {
                    List<Widget> columnChildren = [
                      Divider(
                        height: 0.0,
                        thickness: lineThickness,
                        color: const Color(0xFFFFFFFF),
                      )
                    ];
                    List<Widget> rowChildren = [];
                    for (int j = 0; j < 5; j++) {
                      for (int i = 0; i < 5; i++) {
                        int index = j * 5 + i;
                        rowChildren.add(
                          Expanded(
                            child: InkWell(
                              onTap: gameStatus == GameStatus.play
                                  ? () {
                                      setState(() {
                                        if (statusList[index] ==
                                            PieceStatus.none) {
                                          final t =
                                              GameTurnStyle.placePieceAndRotate(
                                            index,
                                            statusList,
                                            p1: turnOfPlayer1,
                                            p2: turnOfPlayer2,
                                            p3: turnOfPlayer3,
                                          );
                                          turnOfPlayer1 = t.p1;
                                          turnOfPlayer2 = t.p2;
                                          turnOfPlayer3 = t.p3;
                                          // 失敗判定（例：手数超過など）
                                          if (rule.isFailed(statusList)) {
                                            gameStatus = GameStatus.settlement;
                                            _openFailDialog();
                                            return;
                                          }
                                          // チャレンジ判定
                                          if (rule.isCleared(statusList)) {
                                            gameStatus = GameStatus.settlement;
                                            _openClearDialog();
                                          } else {
                                            final info =
                                                WinStyle.judgeBoard(statusList);
                                            if (info.outcome ==
                                                GameOutcome.draw) {
                                              gameStatus = GameStatus.draw;
                                              _openDrawDialog();
                                            }
                                          }
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
                                        final pieceStatus = statusList[index];
                                        switch (pieceStatus) {
                                          case PieceStatus.none:
                                            return Container(
                                              alignment: Alignment.center,
                                              child: gameStatus ==
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
                                              color: Color(0xFF00FFA3),
                                            );
                                        }
                                      }(),
                                    ),
                                    (i == 4)
                                        ? Container()
                                        : VerticalDivider(
                                            width: 0.0,
                                            thickness: lineThickness,
                                            color: const Color(0xFFFFFFFF),
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
                          color: const Color(0xFFFFFFFF),
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
                              color: const Color(0xFFFFFFFF)),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Container(
                              width: lineThickness,
                              color: const Color(0xFFFFFFFF)),
                        ),
                        Stack(children: buildLine),
                      ],
                    );
                  }(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openClearDialog() {
    AppDialog.showWinDialog(
      context,
      title: 'クリア！',
      onCancel: () {
        Navigator.pop(context);
      },
      onOk: () {
        clear();
      },
    );
  }

  void _openDrawDialog() {
    AppDialog.showWinDialog(
      context,
      title: '引き分け',
      onCancel: () {
        Navigator.pop(context);
      },
      onOk: () {
        clear();
      },
    );
  }

  void _openFailDialog() {
    AppDialog.showWinDialog(
      context,
      title: '失敗',
      onCancel: () {
        Navigator.pop(context);
      },
      onOk: () {
        clear();
      },
    );
  }
}
