class BithumbCoin {
  final String base;
  final String target;
  final String openingPrice; // : "504000",
  final String closingPrice; // : "505000",
  final String minPrice; // : "504000",
  final String maxPrice; // : "516000",
  final String unitsTraded; // : "14.71960286",
  final String accTradeValue; // : "16878100",
  final String prevClosingPrice; // : "503000",
  final String unitsTraded24H; // : "1471960286",
  final String accTradeValue24H; // : "16878100",
  final String fluctate24H; // : "1000",
  final String fluctateRate24H; // : 0.19,

  BithumbCoin({
    required this.base,
    required this.target,
    required this.openingPrice,
    required this.closingPrice,
    required this.minPrice,
    required this.maxPrice,
    required this.unitsTraded,
    required this.accTradeValue,
    required this.prevClosingPrice,
    required this.unitsTraded24H,
    required this.accTradeValue24H,
    required this.fluctate24H,
    required this.fluctateRate24H,
  });

  factory BithumbCoin.fromJson(
      Map<String, dynamic> json, String base, String target) {
    return BithumbCoin(
      base: base,
      target: target,
      openingPrice: json["opening_price"],
      closingPrice: json["closing_price"],
      minPrice: json["min_price"],
      maxPrice: json["max_price"],
      unitsTraded: json["units_traded"],
      accTradeValue: json["acc_trade_value"],
      prevClosingPrice: json["prev_closing_price"],
      unitsTraded24H: json["units_traded_24H"],
      accTradeValue24H: json["acc_trade_value_24H"],
      fluctate24H: json["fluctate_24H"],
      fluctateRate24H: json["fluctate_rate_24H"].toString(),
    );
  }
}
