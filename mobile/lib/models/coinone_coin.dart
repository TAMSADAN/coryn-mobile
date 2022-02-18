class CoinoneCoin {
  final String target;
  final String currency; //: "btc",
  final String high; //: "3845000.0",
  final String low; //: "3819000.0",
  final String first; //: "3832000.0",
  final String last; //: "3829000.0",
  final String volume; //: "156.5681",
  final String yesterdayHigh; //: "3846000.0",
  final String yesterdayLow; //: "3800000.0",
  final String yesterdayFirst; //: "3833000.0",
  final String yesterdayLast; //: "3832000.0",
  final String yesterdayVolume; //: "189.8268"

  CoinoneCoin({
    required this.target,
    required this.currency,
    required this.high,
    required this.low,
    required this.first,
    required this.last,
    required this.volume,
    required this.yesterdayHigh,
    required this.yesterdayLow,
    required this.yesterdayFirst,
    required this.yesterdayLast,
    required this.yesterdayVolume,
  });

  factory CoinoneCoin.fromJson(Map<String, dynamic> json, String target) {
    return CoinoneCoin(
      target: target,
      currency: json["currency"].toString().toUpperCase(),
      high: json["high"],
      low: json["low"],
      first: json["first"],
      last: json["last"],
      volume: json["volume"],
      yesterdayHigh: json["yesterday_high"],
      yesterdayLow: json["yesterday_low"],
      yesterdayFirst: json["yesterday_first"],
      yesterdayLast: json["yesterday_last"],
      yesterdayVolume: json["yesterday_volume"],
    );
  }
}
