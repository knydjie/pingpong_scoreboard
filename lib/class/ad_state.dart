// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'dart:io';
//
// //test banner id android: ca-app-pub-3940256099942544/6300978111
// //test banner id ios: ca-app-pub-3940256099942544/2934735716
// //below is using: real ad id [x] - test ad id [v]
//
// class AdState {
//   Future<InitializationStatus> initialization;
//   AdState(this.initialization);
//
//   String get bannerAdUnitId => Platform.isAndroid
//       ? 'ca-app-pub-3940256099942544/6300978111'
//       : 'ca-app-pub-3940256099942544/2934735716';
//
//   BannerAdListener get bannerAdListener => _bannerAdListener;
//
//   final BannerAdListener _bannerAdListener = BannerAdListener(
//     // Called when an ad is successfully received.
//     onAdLoaded: (ad) => print('Ad loaded: ${ad.adUnitId}.'),
//     // Called when an ad request failed.
//     onAdFailedToLoad: (ad, error) {
//       // Dispose the ad here to free resources.
//       ad.dispose();
//       print('Ad failed to loaded: ${ad.adUnitId}, $error.');
//     },
//     // Called when an ad opens an overlay that covers the screen.
//     onAdOpened: (ad) => print('Ad opened: ${ad.adUnitId}.'),
//     // Called when an impression occurs on the ad.
//     onAdImpression: (ad) => print('Ad impression: ${ad.adUnitId}.'),
//   );
// }
