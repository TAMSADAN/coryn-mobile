class CoinGeckoCoin {
  final String base;
  final String target;
  final String timestamp;
  final String lastTradedAt;
  final String lastFetchAt;
  final String tradeUrl;
  final String trustScore;
  final String coinId;
  final String? tokenInfoUrl;
  final Map<String, dynamic> market;
  final Map<String, dynamic> convertedLast;
  final Map<String, dynamic> convertedVolume;
  final double last;
  final double bidAskSpreadPercentage;
  final bool isAnomaly;
  final bool isStale;

  CoinGeckoCoin({
    required this.base,
    required this.target,
    required this.timestamp,
    required this.lastTradedAt,
    required this.lastFetchAt,
    required this.tradeUrl,
    required this.trustScore,
    required this.coinId,
    required this.tokenInfoUrl,
    required this.market,
    required this.convertedLast,
    required this.convertedVolume,
    required this.last,
    required this.bidAskSpreadPercentage,
    required this.isAnomaly,
    required this.isStale,
  });

  factory CoinGeckoCoin.fromJson(Map<String, dynamic> json) {
    return CoinGeckoCoin(
      base: json["base"],
      target: json["target"],
      timestamp: json["timestamp"],
      lastTradedAt: json["last_traded_at"],
      lastFetchAt: json["last_fetch_at"],
      tradeUrl: json["trade_url"],
      trustScore: json["trust_score"],
      coinId: json["coin_id"],
      tokenInfoUrl: json["token_info_url"],
      market: json["market"],
      convertedLast: json["converted_last"],
      convertedVolume: json["converted_volume"],
      last: json["last"],
      bidAskSpreadPercentage: json["bid_ask_spread_percentage"],
      isAnomaly: json["is_anomaly"],
      isStale: json["is_stale"],
    );
  }
}

// "base": "XRP",
//       "target": "KRW",
//       "market": {
//         "name": "Upbit",
//         "identifier": "upbit",
//         "has_trading_incentive": false
//       },
//       "last": 998,
//       "volume": 256874857.61370796,
//       "converted_last": {
//         "btc": 0.00001906,
//         "eth": 0.00027057,
//         "usd": 0.832812
//       },
//       "converted_volume": {
//         "btc": 4897,
//         "eth": 69503,
//         "usd": 213928375
//       },
//       "trust_score": "green",
//       "bid_ask_spread_percentage": 0.1001,
//       "timestamp": "2022-02-17T04:40:57+00:00",
//       "last_traded_at": "2022-02-17T04:40:57+00:00",
//       "last_fetch_at": "2022-02-17T04:40:57+00:00",
//       "is_anomaly": false,
//       "is_stale": false,
//       "trade_url": "https://upbit.com/exchange?code=CRIX.UPBIT.KRW-XRP",
//       "token_info_url": null,
//       "coin_id": "ripple"
