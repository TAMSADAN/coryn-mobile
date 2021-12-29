class Price {
  final int id;
  final String market;
  final double openingPrice;
  final double highPrice;
  final double lowPrice;
  final double tradePrice;
  final double closedPrice;
  final double changeRate;
  final double changePrice;
  final double tradeVolume;
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
    required this.changePrice,
    required this.tradeVolume,
    required this.timestamp,
    required this.source,
    required this.unit,
    required this.currency,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
        id: json["id"],
        market: json["market"],
        openingPrice: json["opening_price"],
        highPrice: json["high_price"],
        lowPrice: json["low_price"],
        tradePrice: json["trade_price"],
        closedPrice: json["closed_price"],
        changeRate: json["change_rate"],
        changePrice: json["change_price"],
        tradeVolume: json["trade_volume"],
        timestamp: DateTime.fromMillisecondsSinceEpoch(json["timestamp"]),
        source: json["source"],
        unit: json["unit"],
        currency: json["currency"]);
  }

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
    openingPrice: 579.76083,
    changePrice: 10,
    highPrice: 579.76083,
    lowPrice: 579.76083,
    tradePrice: 579.76083,
    closedPrice: 579.76083,
    changeRate: 29.9,
    tradeVolume: 10,
    timestamp: DateTime(2021, 12, 14),
    source: "Upbit",
    unit: "day",
    currency: "KRW",
  ),
  Price(
    changePrice: 10,
    id: 0,
    market: "BTC",
    tradeVolume: 10,
    openingPrice: 579.76084,
    highPrice: 579.76084,
    lowPrice: 579.76084,
    tradePrice: 579.76084,
    closedPrice: 579.76084,
    changeRate: 26.8,
    timestamp: DateTime(2021, 12, 15),
    source: "Upbit",
    unit: "day",
    currency: "KRW",
  ),
  Price(
    changePrice: 10,
    id: 0,
    market: "BTC",
    openingPrice: 579.76085,
    tradeVolume: 10,
    highPrice: 579.76085,
    lowPrice: 579.76085,
    tradePrice: 579.76085,
    closedPrice: 579.76085,
    changeRate: 23.6,
    timestamp: DateTime(2021, 12, 16),
    source: "Upbit",
    unit: "day",
    currency: "KRW",
  ),
  Price(
    id: 0,
    changePrice: 10,
    market: "BTC",
    tradeVolume: 10,
    openingPrice: 579.76086,
    highPrice: 579.76086,
    lowPrice: 579.76086,
    tradePrice: 579.76086,
    closedPrice: 579.76086,
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
    changePrice: 10,
    market: "DOGE",
    tradeVolume: 10,
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
    changePrice: 10,
    market: "DOGE",
    tradeVolume: 10,
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
    tradeVolume: 10,
    changePrice: 10,
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
    tradeVolume: 10,
    changePrice: 10,
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
    changePrice: 10,
    market: "STX",
    tradeVolume: 10,
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
    changePrice: 10,
    market: "STX",
    tradeVolume: 10,
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
    changePrice: 10,
    openingPrice: 106,
    highPrice: 106,
    tradeVolume: 10,
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
    changePrice: 10,
    openingPrice: 107,
    highPrice: 107,
    tradeVolume: 10,
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
