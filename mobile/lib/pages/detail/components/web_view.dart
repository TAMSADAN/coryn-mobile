import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HelpScreen extends StatefulWidget {
  @override
  HelpScreenState createState() {
    return HelpScreenState();
  }
}

class HelpScreenState extends State<HelpScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late WebViewController _con;

  String setHTML() {
    return ('''
<!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container">
  <div id="tradingview_05769"></div>
  <div class="tradingview-widget-copyright">TradingView 제공 <a href="https://kr.tradingview.com/symbols/NASDAQ-AAPL/" rel="noopener" target="_blank"><span class="blue-text">AAPL 차트</span></a></div>
  <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
  <script type="text/javascript">
  new TradingView.widget(
  {
    "autosize": true,
  "symbol": "NASDAQ:AAPL",
  "interval": "D",
  "timezone": "Etc/UTC",
  "theme": "light",
  "style": "1",
  "locale": "kr",
  "toolbar_bg": "#f1f3f6",
  "enable_publishing": false,
  "allow_symbol_change": true,
  "container_id": "tradingview_05769"
}
  );
  </script>
</div>
<!-- TradingView Widget END -->

    ''');
  }

  _loadHTML() async {
    _con.loadUrl(Uri.dataFromString(setHTML(),
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://flutter.dev',
      javascriptMode: JavascriptMode.unrestricted,
      zoomEnabled: false,
      onWebViewCreated: (WebViewController webViewController) {
        // _controller.complete(webViewController);
        _con = webViewController;
        _loadHTML();
      },
      onProgress: (int progress) {
        print("WebView is loading (progress : $progress%)");
      },
      navigationDelegate: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          print('blocking navigation}');
          return NavigationDecision.prevent;
        }
        print('allowing navigation to');
        return NavigationDecision.navigate;
      },
      onPageStarted: (String url) {
        print('Page started loading');
      },
      onPageFinished: (String url) {
        print('Page finished loading');
      },
      gestureNavigationEnabled: true,
    );
  }
}
