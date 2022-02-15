class BinanceCoin {
  final BinanceCoinMarket marketData;
  final BinanceCoinPrice priceData;

  BinanceCoin({
    required this.marketData,
    required this.priceData,
  });
}

class BinanceCoinMarket {
  final String symbol;
  final String baseAsset;
  final String quoteAsset;

  BinanceCoinMarket({
    required this.symbol,
    required this.baseAsset,
    required this.quoteAsset,
  });

  factory BinanceCoinMarket.fromJson(Map<String, dynamic> json) {
    return BinanceCoinMarket(
      symbol: json['symbol'],
      baseAsset: json['baseAsset'],
      quoteAsset: json['quoteAsset'],
    );
  }
}

class BinanceCoinPrice {
  final String symbol;
  final String priceChange;
  final String priceChangePercent;
  final String weightedAvgPrice;
  final String prevClosePrice;
  final String lastPrice;
  final String lastQty;
  final String bidPrice;
  final String bidQty;
  final String askPrice;
  final String askQty;
  final String openPrice;
  final String highPrice;
  final String lowPrice;
  final String volume;
  final String quoteVolume;
  final double openTime;
  final double closeTime;
  final double firstId;
  final double lastId;
  final double count;

  BinanceCoinPrice({
    required this.symbol,
    required this.priceChange,
    required this.priceChangePercent,
    required this.weightedAvgPrice,
    required this.prevClosePrice,
    required this.lastPrice,
    required this.lastQty,
    required this.bidPrice,
    required this.bidQty,
    required this.askPrice,
    required this.askQty,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.volume,
    required this.quoteVolume,
    required this.openTime,
    required this.closeTime,
    required this.firstId,
    required this.lastId,
    required this.count,
  });

  factory BinanceCoinPrice.fromJson(Map<String, dynamic> json) {
    return BinanceCoinPrice(
      symbol: json['symbol'],
      priceChange: json['priceChange'],
      priceChangePercent: json['priceChangePercent'],
      weightedAvgPrice: json['weightedAvgPrice'],
      prevClosePrice: json['prevClosePrice'],
      lastPrice: json['lastPrice'],
      lastQty: json['lastQty'],
      bidPrice: json['bidPrice'],
      bidQty: json['bidQty'],
      askPrice: json['askPrice'],
      askQty: json['askQty'],
      openPrice: json['openPrice'],
      highPrice: json['highPrice'],
      lowPrice: json['lowPrice'],
      volume: json['volume'],
      quoteVolume: json['quoteVolume'],
      openTime: double.parse(json['openTime'].toString()),
      closeTime: double.parse(json['closeTime'].toString()),
      firstId: double.parse(json['firstId'].toString()),
      lastId: double.parse(json['lastId'].toString()),
      count: double.parse(json['count'].toString()),
    );
  }
}
