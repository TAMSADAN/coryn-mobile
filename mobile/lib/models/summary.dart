class Summary {
  final String coinName;
  final String coinImageUri;
  final double coinPrice;
  final String coinTicker;
  final String coinMarcket;
  final double dayRange;

  Summary({
    required this.coinName,
    required this.coinImageUri,
    required this.coinPrice,
    required this.coinTicker,
    required this.coinMarcket,
    required this.dayRange,
  });
}

List<Summary> summaryList = [
  Summary(
    coinName: "비트코인",
    coinImageUri: "https://static.upbit.com/logos/BTC.png",
    coinPrice: 5944000000,
    coinTicker: "BTC",
    coinMarcket: "KRW",
    dayRange: 12.4,
  ),
  Summary(
    coinName: "도지코인",
    coinImageUri: "https://static.upbit.com/logos/DOGE.png",
    coinPrice: 215,
    coinTicker: "DOGE",
    coinMarcket: "KRW",
    dayRange: 7.4,
  ),
  Summary(
    coinName: "스택스",
    coinImageUri: "https://static.upbit.com/logos/STX.png",
    coinPrice: 2705,
    coinTicker: "STX",
    coinMarcket: "KRW",
    dayRange: -3.2,
  )
];
