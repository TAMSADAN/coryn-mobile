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
  final double price;

  BinanceCoinPrice({
    required this.symbol,
    required this.price,
  });

  factory BinanceCoinPrice.fromJson(Map<String, dynamic> json) {
    return BinanceCoinPrice(
      symbol: json['symbol'].toString(),
      price: double.parse(json['price'].toString()),
    );
  }
}
