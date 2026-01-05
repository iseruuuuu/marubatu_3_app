// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:barubatu_3_app/gen/assets.gen.dart';
import 'package:barubatu_3_app/gen/l10n/l10n.dart';

class TrophyScreen extends StatelessWidget {
  const TrophyScreen({
    super.key,
    required this.isClear1,
    required this.isClear2,
    required this.isClear3,
    required this.isClear4,
    required this.isClear5,
  });

  final bool isClear1;
  final bool isClear2;
  final bool isClear3;
  final bool isClear4;
  final bool isClear5;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.white,
        elevation: 0,
        title: Text(L10n.of(context).trophyTitle),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20.w,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blueAccent,
              size: 35,
            ),
            onPressed: () {
              // stopBgm();
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            isClear1
                ? Assets.images.gold1
                    .image(width: deviceSize / 7, height: deviceSize / 7)
                : Assets.images.grey1
                    .image(width: deviceSize / 7, height: deviceSize / 7),
            isClear2
                ? Assets.images.gold2
                    .image(width: deviceSize / 7, height: deviceSize / 7)
                : Assets.images.grey2
                    .image(width: deviceSize / 7, height: deviceSize / 7),
            isClear3
                ? Assets.images.gold3
                    .image(width: deviceSize / 7, height: deviceSize / 7)
                : Assets.images.grey3
                    .image(width: deviceSize / 7, height: deviceSize / 7),
            isClear4
                ? Assets.images.gold4
                    .image(width: deviceSize / 7, height: deviceSize / 7)
                : Assets.images.grey4
                    .image(width: deviceSize / 7, height: deviceSize / 7),
            isClear5
                ? Assets.images.gold5
                    .image(width: deviceSize / 7, height: deviceSize / 7)
                : Assets.images.grey5
                    .image(width: deviceSize / 7, height: deviceSize / 7),
          ],
        ),
      ),
    );
  }
}
