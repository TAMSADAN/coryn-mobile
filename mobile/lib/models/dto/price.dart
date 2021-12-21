class Price {
  final int id;
  final String market;
  final double openingPrice;
  final double highPrice;
  final double lowPrice;
  final double tradePrice;
  final double closedPrice;
  final double changeRate;
  final DateTime timestamp;
  final String source;
  final String unit;

  Price({
    required this.id,
    required this.market,
    required this.openingPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.tradePrice,
    required this.closedPrice,
    required this.changeRate,
    required this.timestamp,
    required this.source,
    required this.unit,
  });
}

List<Price> dummyBitcoinPriceList = [
  Price(
    id: 0,
    market: "BTC",
    openingPrice: 57976083.11,
    highPrice: 57976083.11,
    lowPrice: 57976083.11,
    tradePrice: 57976083.11,
    closedPrice: 57976083.11,
    changeRate: 57976083.11,
    timestamp: DateTime(2021, 12, 14),
    source: "Upbit",
    unit: "day",
  ),
  Price(
    id: 0,
    market: "BTC",
    openingPrice: 57976084,
    highPrice: 57976084,
    lowPrice: 57976084,
    tradePrice: 57976084,
    closedPrice: 57976084,
    changeRate: 57976084,
    timestamp: DateTime(2021, 12, 15),
    source: "Upbit",
    unit: "day",
  ),
  Price(
    id: 0,
    market: "BTC",
    openingPrice: 57976085,
    highPrice: 57976085,
    lowPrice: 57976085,
    tradePrice: 57976085,
    closedPrice: 57976085,
    changeRate: 57976085,
    timestamp: DateTime(2021, 12, 16),
    source: "Upbit",
    unit: "day",
  ),
  Price(
    id: 0,
    market: "BTC",
    openingPrice: 57976086,
    highPrice: 57976086,
    lowPrice: 57976086,
    tradePrice: 57976086,
    closedPrice: 57976086,
    changeRate: 57976086,
    timestamp: DateTime(2021, 12, 17),
    source: "Upbit",
    unit: "day",
  ),
];
