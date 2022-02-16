import 'package:mobile/models/binance_coin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile/models/coin.dart';

class TradingViewService {
  Future<String?> fetchTradingViewHTML(
      String baseSymbol, String quoteSymbol, String platform) async {
    String html = _parseToHTML(baseSymbol, quoteSymbol, platform);

    return html;
  }

  Future<bool> isOkTradingView(
      String baseSymbol, String quoteSymbol, String platform) async {
    String _url = _parseToUrl(baseSymbol, quoteSymbol, platform);

    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  String _parseToUrl(String baseSymbol, String quoteSymbol, String platform) {
    String url =
        "https://kr.tradingview.com/symbols/${baseSymbol + quoteSymbol}/?exchange=$platform";

    return url;
  }

  String _parseToHTML(String baseSymbol, String quoteSymbol, String platform) {
    String _url = _parseToUrl(baseSymbol, quoteSymbol, platform);
    String html = '''
      <div class="tradingview-widget-container">
        <div id="tradingview_dec9c"></div>
        <div class="tradingview-widget-copyright">TradingView 제공 <a href="$_url" rel="noopener" target="_blank"><span class="blue-text">${baseSymbol + quoteSymbol} 차트</span></a></div>
        <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
        <script type="text/javascript">
        new TradingView.widget(
        {
        "autosize": true,
        "symbol": "$platform:${baseSymbol + quoteSymbol}",
        "interval": "D",
        "timezone": "Etc/UTC",
        "theme": "light",
        "style": "1",
        "locale": "kr",
        "toolbar_bg": "#f1f3f6",
        "enable_publishing": false,
        "hide_legend": true,
        "save_image": false,
        "container_id": "tradingview_decc"
      }
        );
        </script>
      </div>
    ''';

    return html;
  }

  List<Coin>? parseCoinList(List<BinanceCoin> binanceCoinList) {
    List<Coin> coinList = [];

    try {
      for (var _binanceCoin in binanceCoinList) {
        Coin _coin = Coin(
            platform: "바이낸스",
            baseSymbol: _binanceCoin.marketData.baseAsset,
            quoteSymbol: _binanceCoin.marketData.quoteAsset,
            koreanName: null,
            englishName: null,
            tradePrice: double.parse(_binanceCoin.priceData.openPrice),
            changeRate: double.parse(_binanceCoin.priceData.priceChangePercent),
            changePrice: double.parse(_binanceCoin.priceData.priceChange),
            volume: double.parse(_binanceCoin.priceData.volume));
        coinList.add(_coin);
      }
    } catch (e) {
      print("BinanceService parseCoinList parse error");
      return null;
    }
    return coinList;
  }
}
