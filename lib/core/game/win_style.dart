// Static-only class is used intentionally to provide a namespaced API.
// ignore_for_file: avoid_classes_with_only_static_members
import 'package:barubatu_3_app/model/model.dart';

enum GameOutcome { none, win, draw }

class WinInfo {
  const WinInfo(this.outcome, {this.category, this.index});
  final GameOutcome outcome;
  final String? category; // 'h','v','d'
  final int? index;
}

class WinStyle {
  // 5x5 上で3並びのパターン（game_screen に合わせる）
  static const settlementListHorizontal = [
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

  static const settlementListVertical = [
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

  static const settlementListDiagonal = [
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

  static WinInfo judgeBoard(List<PieceStatus> statusList) {
    // draw
    if (!statusList.contains(PieceStatus.none)) {
      return const WinInfo(GameOutcome.draw);
    }
    // horizontal
    for (var i = 0; i < settlementListHorizontal.length; i++) {
      final a = settlementListHorizontal[i];
      if (_sameTriple(statusList, a)) {
        return WinInfo(GameOutcome.win, category: 'h', index: i);
      }
    }
    // vertical
    for (var i = 0; i < settlementListVertical.length; i++) {
      final a = settlementListVertical[i];
      if (_sameTriple(statusList, a)) {
        return WinInfo(GameOutcome.win, category: 'v', index: i);
      }
    }
    // diagonal
    for (var i = 0; i < settlementListDiagonal.length; i++) {
      final a = settlementListDiagonal[i];
      if (_sameTriple(statusList, a)) {
        return WinInfo(GameOutcome.win, category: 'd', index: i);
      }
    }
    return const WinInfo(GameOutcome.none);
  }

  static bool _sameTriple(List<PieceStatus> s, List<int> idx) {
    return s[idx[0]] == s[idx[1]] &&
        s[idx[1]] == s[idx[2]] &&
        s[idx[0]] != PieceStatus.none;
  }
}
