import 'package:barubatu_3_app/core/game/win_style.dart';
import 'package:barubatu_3_app/model/model.dart';

enum ChallengeId { level1, level2, level3, level4, level5 }

abstract class ChallengeRule {
  String get title;
  String get description;
  bool isCleared(List<PieceStatus> statusList);
  bool isFailed(List<PieceStatus> statusList);
}

class SimpleWinRule implements ChallengeRule {
  @override
  final String title;
  @override
  final String description;

  const SimpleWinRule({
    this.title = '3つ並べで勝利',
    this.description = '誰かが3つ並べで勝利したらクリア',
  });

  @override
  bool isCleared(List<PieceStatus> statusList) {
    final info = WinStyle.judgeBoard(statusList);
    return info.outcome == GameOutcome.win;
  }

  @override
  bool isFailed(List<PieceStatus> statusList) {
    return false;
  }
}

class WinnerAtMostMovesRule implements ChallengeRule {
  @override
  final String title;
  @override
  final String description;
  final PieceStatus winner;
  final int maxMoves;

  const WinnerAtMostMovesRule({
    required this.winner,
    required this.maxMoves,
    required this.title,
    required this.description,
  });

  @override
  bool isCleared(List<PieceStatus> statusList) {
    final info = WinStyle.judgeBoard(statusList);
    if (info.outcome != GameOutcome.win) return false;
    final winningPiece = _winningPiece(statusList, info);
    final moves = _moveCount(statusList);
    return winningPiece == winner && moves <= maxMoves;
  }

  @override
  bool isFailed(List<PieceStatus> statusList) {
    final moves = _moveCount(statusList);
    return moves > maxMoves;
  }
}

class WinnerExactMovesRule implements ChallengeRule {
  @override
  final String title;
  @override
  final String description;
  final PieceStatus winner;
  final int exactMoves;

  const WinnerExactMovesRule({
    required this.winner,
    required this.exactMoves,
    required this.title,
    required this.description,
  });

  @override
  bool isCleared(List<PieceStatus> statusList) {
    final info = WinStyle.judgeBoard(statusList);
    if (info.outcome != GameOutcome.win) return false;
    final winningPiece = _winningPiece(statusList, info);
    final moves = _moveCount(statusList);
    return winningPiece == winner && moves == exactMoves;
  }

  @override
  bool isFailed(List<PieceStatus> statusList) {
    final info = WinStyle.judgeBoard(statusList);
    final moves = _moveCount(statusList);
    // 手数超過は即失敗
    if (moves > exactMoves) return true;
    // 早すぎる勝利も失敗（厳密に exactMoves 手目のみ可）
    if (info.outcome == GameOutcome.win && moves < exactMoves) return true;
    // ちょうど exactMoves 手目で未勝利または別勝者も失敗
    if (moves == exactMoves) {
      if (info.outcome != GameOutcome.win) return true;
      final winningPiece = _winningPiece(statusList, info);
      if (winningPiece != winner) return true;
    }
    return false;
  }
}

class DrawRule implements ChallengeRule {
  @override
  final String title;
  @override
  final String description;

  const DrawRule({
    required this.title,
    required this.description,
  });

  @override
  bool isCleared(List<PieceStatus> statusList) {
    final info = WinStyle.judgeBoard(statusList);
    return info.outcome == GameOutcome.draw;
  }

  @override
  bool isFailed(List<PieceStatus> statusList) {
    return false;
  }
}

int _moveCount(List<PieceStatus> statusList) {
  int count = 0;
  for (final p in statusList) {
    if (p != PieceStatus.none) count++;
  }
  return count;
}

PieceStatus? _winningPiece(List<PieceStatus> s, WinInfo info) {
  if (info.outcome != GameOutcome.win || info.index == null) return null;
  List<List<int>> list;
  switch (info.category) {
    case 'h':
      list = WinStyle.settlementListHorizontal;
      break;
    case 'v':
      list = WinStyle.settlementListVertical;
      break;
    case 'd':
      list = WinStyle.settlementListDiagonal;
      break;
    default:
      return null;
  }
  final triple = list[info.index!];
  return s[triple[0]];
}

class ChallengeRules {
  static final Map<ChallengeId, ChallengeRule> byId = {
    ChallengeId.level1: const WinnerAtMostMovesRule(
      winner: PieceStatus.circle,
      maxMoves: 7,
      title: 'レベル1',
      description: '7手以内に◯で勝利せよ',
    ),
    ChallengeId.level2: const WinnerExactMovesRule(
      winner: PieceStatus.circle,
      exactMoves: 10,
      title: 'レベル2',
      description: '10手ぴったりで◯が勝利',
    ),
    ChallengeId.level3: const WinnerExactMovesRule(
      winner: PieceStatus.square,
      exactMoves: 15,
      title: 'レベル3',
      description: '15手ぴったりで□が勝利',
    ),
    ChallengeId.level4: const WinnerExactMovesRule(
      winner: PieceStatus.square,
      exactMoves: 24,
      title: 'レベル4',
      description: '24手ぴったりで□が勝利',
    ),
    ChallengeId.level5: const DrawRule(
      title: 'レベル5',
      description: '引き分けにしろ',
    ),
  };
}
