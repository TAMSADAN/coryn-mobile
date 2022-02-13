class UbitPrice {
  final String market;
  final String tradeDate;
  final String tradeTime;
  final String tradeDateKST;
  final String tradeTimeKST;
  final int tradeTimestamp;
  final double openingPrice;
  final double highPrice;
  final double lowPrice;
  final double tradePrice;
  final double prevClosingPrice;
  final String change;
  final double changePrice;
  final double changeRate;
  final double signedChangePrice;
  final double signedChangeRate;
  final double tradeVolume;
  final double accTradePrice;
  final double accTradePrice24h;
  final double accTradeVolume;
  final double accTradeVolume24h;
  final double highest52WeekPrice;
  final String highest52WeekDate;
  final double lowest52WeekPrice;
  final String lowest52WeekDate;
  final int timestamp;

  UbitPrice({
    required this.market,
    required this.tradeDate,
    required this.tradeTime,
    required this.tradeDateKST,
    required this.tradeTimeKST,
    required this.tradeTimestamp,
    required this.openingPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.tradePrice,
    required this.prevClosingPrice,
    required this.change,
    required this.changePrice,
    required this.changeRate,
    required this.signedChangePrice,
    required this.signedChangeRate,
    required this.tradeVolume,
    required this.accTradePrice,
    required this.accTradePrice24h,
    required this.accTradeVolume,
    required this.accTradeVolume24h,
    required this.highest52WeekPrice,
    required this.highest52WeekDate,
    required this.lowest52WeekPrice,
    required this.lowest52WeekDate,
    required this.timestamp,
  });
}
