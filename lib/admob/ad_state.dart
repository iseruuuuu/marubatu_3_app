import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState {
  Future<InitializationStatus> initialization;

  AdState(this.initialization);

  //TODO 本番ID
  // String get bannerAdUnitId => Platform.isAndroid
  //     //Android
  //     ? "ca-app-pub-3471170179614589/4098703470"
  //     //IOS
  //     : "ca-app-pub-3471170179614589/6329728103";

  String get bannerAdUnitId => Platform.isAndroid
      ? "ca-app-pub-3940256099942544/6300978111"
      : "ca-app-pub-3940256099942544/2934735716";

  BannerAdListener get adListener => _adListener;
  final BannerAdListener _adListener = BannerAdListener(
    onAdLoaded: (ad) => debugPrint('Ad loaded: ${ad.adUnitId}.'),
    onAdClosed: (ad) => debugPrint('Ad closed: ${ad.adUnitId}.'),
    onAdFailedToLoad: (ad, error) =>
        debugPrint('Ad failed to load: ${ad.adUnitId}, $error.'),
    onAdOpened: (ad) => debugPrint('Ad opened: ${ad.adUnitId}.'),
  );
}
