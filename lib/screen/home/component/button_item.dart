// Flutter imports:
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xFF111118),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF00FFA3), width: 3),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 3),
              blurRadius: 0,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: GoogleFonts.dotGothic16(
              fontSize: 20,
              color: const Color(0xFF00FFA3),
              letterSpacing: 1.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
