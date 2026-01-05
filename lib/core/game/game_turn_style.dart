import 'package:barubatu_3_app/model/model.dart';

typedef Turn = ({bool p1, bool p2, bool p3});

class GameTurnStyle {
  static Turn placePieceAndRotate(
    int index,
    List<PieceStatus> statusList, {
    required bool p1,
    required bool p2,
    required bool p3,
  }) {
    if (statusList[index] != PieceStatus.none) {
      return (p1: p1, p2: p2, p3: p3);
    }
    if (p1) {
      statusList[index] = PieceStatus.circle;
      return (p1: false, p2: true, p3: false);
    } else if (p2) {
      statusList[index] = PieceStatus.cross;
      return (p1: false, p2: false, p3: true);
    } else {
      statusList[index] = PieceStatus.square;
      return (p1: true, p2: false, p3: false);
    }
  }
}
