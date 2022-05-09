import 'package:barubatu_3_app/model/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Container(
        width: 280,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          boxShadow: [
            BoxShadow(
              color: ColorStyle.white.withOpacity(0.6),
              spreadRadius: 4,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 25,
              color: CupertinoColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.grey.shade100,
        onPrimary: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
