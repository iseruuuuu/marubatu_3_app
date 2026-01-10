import 'package:flutter/material.dart';

class SpriteButton extends StatelessWidget {
  const SpriteButton({
    required this.onPressed,
    required this.bgImagePath,
    super.key,
    this.textColor = Colors.white,
  });

  final VoidCallback onPressed;
  final String bgImagePath;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.9;
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(28),
      child: SizedBox(
        width: width,
        height: 86,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Image.asset(
                bgImagePath,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
