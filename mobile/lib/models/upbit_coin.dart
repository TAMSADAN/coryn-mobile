class UpbitCoin {
  final UpbitCoinMarket marketData;
  final UpbitCoinPrice priceData;

  UpbitCoin({
    required this.marketData,
    required this.priceData,
  });
}

class UpbitCoinMarket {
  final String market;
  final String koreanName;
  final String englishName;
  final String marketWarning;

  UpbitCoinMarket({
    required this.market,
    required this.koreanName,
    required this.englishName,
    required this.marketWarning,
  });

  factory UpbitCoinMarket.fromJson(Map<String, dynamic> json) {
    return UpbitCoinMarket(
      market: json['market'],
      koreanName: json['korean_name'],
      englishName: json['english_name'],
      marketWarning: json['market_warning'] ?? "",
    );
  }
}

class UpbitCoinPrice {
  final String market;
  final String tradeDate;
  final String tradeTime;
  final String tradeDateKST;
  final String tradeTimeKST;
  final String change;
  final String lowest52WeekDate;
  final String highest52WeekDate;
  final int tradeTimestamp;
  final int timestamp;
  final double openingPrice;
  final double highPrice;
  final double lowPrice;
  final double tradePrice;
  final double prevClosingPrice;
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
  final double lowest52WeekPrice;

  UpbitCoinPrice({
    required this.market,
    required this.tradeDate,
    required this.tradeTime,
    required this.tradeDateKST,
    required this.tradeTimeKST,
    required this.change,
    required this.lowest52WeekDate,
    required this.highest52WeekDate,
    required this.tradeTimestamp,
    required this.timestamp,
    required this.openingPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.tradePrice,
    required this.prevClosingPrice,
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
    required this.lowest52WeekPrice,
  });

  factory UpbitCoinPrice.fromJson(Map<String, dynamic> json) {
    return UpbitCoinPrice(
      market: json['market'],
      tradeDate: json['trade_date'],
      tradeTime: json['trade_time'],
      tradeDateKST: json['trade_date_kst'],
      tradeTimeKST: json['trade_time_kst'],
      change: json['change'],
      lowest52WeekDate: json['lowest_52_week_date'],
      highest52WeekDate: json['highest_52_week_date'],
      tradeTimestamp: json['trade_timestamp'],
      timestamp: json['timestamp'],
      openingPrice: json['opening_price'] * 1.0,
      highPrice: json['high_price'] * 1.0,
      lowPrice: json['low_price'] * 1.0,
      tradePrice: json['trade_price'] * 1.0,
      prevClosingPrice: json['prev_closing_price'] * 1.0,
      changePrice: json['change_price'] * 1.0,
      changeRate: json['change_rate'] * 1.0,
      signedChangePrice: json['signed_change_price'] * 1.0,
      signedChangeRate: json['signed_change_rate'] * 1.0,
      tradeVolume: json['trade_volume'] * 1.0,
      accTradePrice: json['acc_trade_price'] * 1.0,
      accTradePrice24h: json['acc_trade_price_24h'] * 1.0,
      accTradeVolume: json['acc_trade_volume'] * 1.0,
      accTradeVolume24h: json['acc_trade_volume_24h'] * 1.0,
      highest52WeekPrice: json['highest_52_week_price'] * 1.0,
      lowest52WeekPrice: json['lowest_52_week_price'] * 1.0,
    );
  }
}
