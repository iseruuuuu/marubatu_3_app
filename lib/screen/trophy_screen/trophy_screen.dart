import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../gen/assets.gen.dart';
import 'package:audioplayers/audioplayers.dart';

class TrophyScreen extends StatefulWidget {
  const TrophyScreen({
    Key? key,
    required this.isClear1,
    required this.isClear2,
    required this.isClear3,
    required this.isClear4,
    required this.isClear5,
  }) : super(key: key);

  final bool isClear1;
  final bool isClear2;
  final bool isClear3;
  final bool isClear4;
  final bool isClear5;

  @override
  _TrophyScreenState createState() => _TrophyScreenState();
}

class _TrophyScreenState extends State<TrophyScreen> with RouteAware {
  // static const backgroundMusic = 'images/trophy_b.mp3';
  // final AudioCache _cache = AudioCache(fixedPlayer: AudioPlayer());
  // AudioPlayer? _player;

  // void bgmPlayer({required String name, bool isLoop = true}) {
  //   () async {
  //     await _player?.stop();
  //     await _player?.dispose();
  //     if (isLoop) {
  //       _player = await _cache.loop(name, mode: PlayerMode.MEDIA_PLAYER);
  //     } else {
  //       _player = await _cache.play(name, mode: PlayerMode.MEDIA_PLAYER);
  //     }
  //   }();
  // }

  // void stopBgm() async {
  //   await _player?.stop();
  // }
  //
  // Future<void> disposeBgm() async {
  //   return await _player?.dispose();
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   bgmPlayer(name: backgroundMusic);
  // }

  @override
  void dispose() {
    super.dispose();
    // stopBgm();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.white,
        elevation: 0,
        title: const Text('Your Record'),
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
      body: Column(
        children: [
          const Spacer(),
          ImageSlideshow(
            autoPlayInterval: 3000,
            isLoop: true,
            children: [
              widget.isClear1
                  ? Assets.images.gold1
                      .image(width: deviceSize / 6, height: deviceSize / 6)
                  : Assets.images.grey1
                      .image(width: deviceSize / 6, height: deviceSize / 6),
              widget.isClear2
                  ? Assets.images.gold2
                      .image(width: deviceSize / 6, height: deviceSize / 6)
                  : Assets.images.grey2
                      .image(width: deviceSize / 6, height: deviceSize / 6),
              widget.isClear3
                  ? Assets.images.gold3
                      .image(width: deviceSize / 6, height: deviceSize / 6)
                  : Assets.images.grey3
                      .image(width: deviceSize / 6, height: deviceSize / 6),
              widget.isClear4
                  ? Assets.images.gold4
                      .image(width: deviceSize / 6, height: deviceSize / 6)
                  : Assets.images.grey4
                      .image(width: deviceSize / 6, height: deviceSize / 6),
              widget.isClear5
                  ? Assets.images.gold5
                      .image(width: deviceSize / 6, height: deviceSize / 6)
                  : Assets.images.grey5
                      .image(width: deviceSize / 6, height: deviceSize / 6),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
