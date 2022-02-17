class CorynStatic {
  static const List<String> platformKoreanNameList = ['업비트', '바이낸스'];
  static const List<String> platformEnglishNameList = ['UPBIT', 'BINANCE'];
  static const Map<String, String> platformData = {
    "업비트": "UPBIT",
    "바이낸스": "BINANCE",
  };

  String parseToPlatformKoreanName(String value) {
    if (value == "UPBIT") {
      return "업비트";
    } else if (value == "BINANCE") {
      return "바이낸스";
    } else {
      return " ";
    }
  }
}
