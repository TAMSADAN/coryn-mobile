import 'dart:io';
import 'package:flutter/foundation.dart';

class AdHelper {
  static String get bannerAdUnitId {
    if (kReleaseMode) {
      if (Platform.isAndroid) {
        return 'ca-app-pub-2392187154020666/5495255058';
      } else if (Platform.isIOS) {
        return 'ca-app-pub-2392187154020666/3753882950';
      } else {
        throw new UnsupportedError('Unsupported platform');
      }
    }
    // 테스트
    else {
      if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/6300978111';
      } else if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544/2934735716';
      } else {
        throw new UnsupportedError('Unsupported platform');
      }
    }
  }

  static String get openningAdUnitId {
    if (kReleaseMode) {
      if (Platform.isAndroid) {
        return "ca-app-pub-2392187154020666/1043492230";
      } else if (Platform.isIOS) {
        return "ca-app-pub-2392187154020666/6879844368";
      } else {
        throw new UnsupportedError("Unsupported platform");
      }
    }
    // 테스트
    else {
      if (Platform.isAndroid) {
        return "ca-app-pub-3940256099942544/3419835294";
      } else if (Platform.isIOS) {
        return "ca-app-pub-3940256099942544/5662855259";
      } else {
        throw new UnsupportedError("Unsupported platform");
      }
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/5224354917";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
