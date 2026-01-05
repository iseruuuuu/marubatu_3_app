import 'package:barubatu_3_app/core/game/game_turn_style.dart';
import 'package:barubatu_3_app/core/game/win_style.dart';
import 'package:barubatu_3_app/model/model.dart';
import 'package:flutter/material.dart';
import 'package:barubatu_3_app/ui/components/app_dialog.dart';

class GameScreenControler {
  bool turnOfPlayer1 = true;
  bool turnOfPlayer2 = false;
  bool turnOfPlayer3 = false;
  List<PieceStatus> statusList = List.filled(25, PieceStatus.none);
  GameStatus gameStatus = GameStatus.play;

  void clear() {
    turnOfPlayer1 = true;
    turnOfPlayer2 = false;
    turnOfPlayer3 = false;
    statusList = List.filled(25, PieceStatus.none);
    gameStatus = GameStatus.play;
  }

  void handleTap(int index) {
    if (gameStatus != GameStatus.play) return;
    if (statusList[index] != PieceStatus.none) return;

    final t = GameTurnStyle.placePieceAndRotate(
      index,
      statusList,
      p1: turnOfPlayer1,
      p2: turnOfPlayer2,
      p3: turnOfPlayer3,
    );
    turnOfPlayer1 = t.p1;
    turnOfPlayer2 = t.p2;
    turnOfPlayer3 = t.p3;

    final info = WinStyle.judgeBoard(statusList);
    if (info.outcome == GameOutcome.draw) {
      gameStatus = GameStatus.draw;
      return;
    }
    if (info.outcome == GameOutcome.win) {
      gameStatus = GameStatus.settlement;
      return;
    }
  }

  void onTapImageDialog(BuildContext context) {
    AppDialog.showWinListDialog(context);
  }
}
