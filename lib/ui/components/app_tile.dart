import 'package:barubatu_3_app/model/model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppTile extends StatelessWidget {
  const AppTile({
    required this.pieceStatus,
    required this.showGuide,
    super.key,
  });

  final PieceStatus pieceStatus;
  final bool showGuide;

  @override
  Widget build(BuildContext context) {
    switch (pieceStatus) {
      case PieceStatus.none:
        return Container(
          alignment: Alignment.center,
          child: showGuide
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
        return const Icon(
          FontAwesomeIcons.circle,
          size: 60,
          color: Color(0xFF4FDFFF),
        );
      case PieceStatus.cross:
        return const Icon(
          Icons.clear,
          size: 75,
          color: Color(0xFFFF6B6B),
        );
      case PieceStatus.square:
        return const Icon(
          FontAwesomeIcons.square,
          size: 60,
          color: Color(0xFF6EE7B7),
        );
    }
  }
}
