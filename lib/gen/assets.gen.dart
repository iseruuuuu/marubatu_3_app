/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

// Flutter imports:
import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/dialog.png
  AssetGenImage get dialog => const AssetGenImage('assets/images/dialog.png');

  /// File path: assets/images/game.gif
  AssetGenImage get game => const AssetGenImage('assets/images/game.gif');

  /// File path: assets/images/gold1.png
  AssetGenImage get gold1 => const AssetGenImage('assets/images/gold1.png');

  /// File path: assets/images/gold2.png
  AssetGenImage get gold2 => const AssetGenImage('assets/images/gold2.png');

  /// File path: assets/images/gold3.png
  AssetGenImage get gold3 => const AssetGenImage('assets/images/gold3.png');

  /// File path: assets/images/gold4.png
  AssetGenImage get gold4 => const AssetGenImage('assets/images/gold4.png');

  /// File path: assets/images/gold5.png
  AssetGenImage get gold5 => const AssetGenImage('assets/images/gold5.png');

  /// File path: assets/images/grey1.png
  AssetGenImage get grey1 => const AssetGenImage('assets/images/grey1.png');

  /// File path: assets/images/grey2.png
  AssetGenImage get grey2 => const AssetGenImage('assets/images/grey2.png');

  /// File path: assets/images/grey3.png
  AssetGenImage get grey3 => const AssetGenImage('assets/images/grey3.png');

  /// File path: assets/images/grey4.png
  AssetGenImage get grey4 => const AssetGenImage('assets/images/grey4.png');

  /// File path: assets/images/grey5.png
  AssetGenImage get grey5 => const AssetGenImage('assets/images/grey5.png');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
