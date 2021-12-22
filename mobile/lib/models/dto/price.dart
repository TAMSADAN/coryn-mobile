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
  final String currency;

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
    required this.currency,
  });

  getChartDate() {
    if (this.unit == "minute") {
      return this.timestamp.hour.toString() +
          '.' +
          this.timestamp.minute.toString();
    } else if (this.unit == "day") {
      return this.timestamp.month.toString() +
          '/' +
          this.timestamp.day.toString();
    } else if (this.unit == "month") {
      return this.timestamp.year.toString() +
          '/' +
          this.timestamp.month.toString();
    } else if (this.unit == "year") {
      return this.timestamp.year.toString();
    } else {
      return this.timestamp.month.toString() +
          '/' +
          this.timestamp.day.toString();
    }
  }
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
    changeRate: 29.9,
    timestamp: DateTime(2021, 12, 14),
    source: "Upbit",
    unit: "day",
    currency: "KRW",
  ),
  Price(
    id: 0,
    market: "BTC",
    openingPrice: 57976084,
    highPrice: 57976084,
    lowPrice: 57976084,
    tradePrice: 57976084,
    closedPrice: 57976084,
    changeRate: 26.8,
    timestamp: DateTime(2021, 12, 15),
    source: "Upbit",
    unit: "day",
    currency: "KRW",
  ),
  Price(
    id: 0,
    market: "BTC",
    openingPrice: 57976085,
    highPrice: 57976085,
    lowPrice: 57976085,
    tradePrice: 57976085,
    closedPrice: 57976085,
    changeRate: 23.6,
    timestamp: DateTime(2021, 12, 16),
    source: "Upbit",
    unit: "day",
    currency: "KRW",
  ),
  Price(
    id: 0,
    market: "BTC",
    openingPrice: 57976086,
    highPrice: 57976086,
    lowPrice: 57976086,
    tradePrice: 57976086,
    closedPrice: 57976086,
    changeRate: 12.6,
    timestamp: DateTime(2021, 12, 17),
    source: "Upbit",
    unit: "day",
    currency: "KRW",
  ),
];

List<Price> dummyDogecoinPriceList = [
  Price(
    id: 0,
    market: "DOGE",
    highPrice: 213,
    openingPrice: 213,
    lowPrice: 213,
    tradePrice: 213,
    closedPrice: 213,
    changeRate: 10.5,
    timestamp: DateTime(2021, 12, 14),
    source: "Upbit",
    unit: "day",
    currency: "KRW",
  ),
  Price(
    id: 0,
    market: "DOGE",
    openingPrice: 214,
    highPrice: 214,
    lowPrice: 214,
    tradePrice: 214,
    closedPrice: 214,
    changeRate: 12.4,
    timestamp: DateTime(2021, 12, 15),
    source: "Upbit",
    unit: "day",
    currency: "KRW",
  ),
  Price(
    id: 0,
    market: "DOGE",
    openingPrice: 215,
    highPrice: 215,
    lowPrice: 215,
    tradePrice: 215,
    closedPrice: 215,
    changeRate: 10.3,
    timestamp: DateTime(2021, 12, 16),
    source: "Upbit",
    unit: "day",
    currency: "KRW",
  ),
  Price(
    id: 0,
    market: "DOGE",
    openingPrice: 216,
    highPrice: 216,
    lowPrice: 216,
    tradePrice: 216,
    closedPrice: 216,
    changeRate: 10,
    timestamp: DateTime(2021, 12, 17),
    source: "Upbit",
    unit: "day",
    currency: "KRW",
  ),
];

List<Price> dummyStacksPriceList = [
  Price(
    id: 0,
    market: "STX",
    openingPrice: 106,
    highPrice: 106,
    lowPrice: 106,
    tradePrice: 106,
    closedPrice: 106,
    changeRate: -10,
    timestamp: DateTime(2021, 12, 14),
    source: "Upbit",
    unit: "day",
    currency: "KRW",
  ),
  Price(
    id: 0,
    market: "STX",
    openingPrice: 106,
    highPrice: 106,
    lowPrice: 106,
    tradePrice: 106,
    closedPrice: 106,
    changeRate: -10,
    timestamp: DateTime(2021, 12, 15),
    source: "Upbit",
    unit: "day",
    currency: "KRW",
  ),
  Price(
    id: 0,
    market: "STX",
    openingPrice: 106,
    highPrice: 106,
    lowPrice: 106,
    tradePrice: 106,
    closedPrice: 106,
    changeRate: -10,
    timestamp: DateTime(2021, 12, 16),
    source: "Upbit",
    unit: "day",
    currency: "KRW",
  ),
  Price(
    id: 0,
    market: "STX",
    openingPrice: 107,
    highPrice: 107,
    lowPrice: 107,
    tradePrice: 107,
    closedPrice: 107,
    changeRate: -10,
    timestamp: DateTime(2021, 12, 17),
    source: "Upbit",
    unit: "day",
    currency: "KRW",
  ),
];
