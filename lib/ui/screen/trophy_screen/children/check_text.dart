// Flutter imports:
import 'package:flutter/material.dart';

class CheckText extends StatelessWidget {
  const CheckText({
    Key? key,
    required this.isOpen,
  }) : super(key: key);

  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 6,
      child: Center(
        child: !isOpen
            ? const Text(
                '未所持',
              )
            : const Text('獲得済み'),
      ),
    );
  }
}
