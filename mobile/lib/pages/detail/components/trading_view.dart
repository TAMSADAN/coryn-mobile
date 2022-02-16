import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/pages/detail/controllers/detail_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TradingView extends StatefulWidget {
  @override
  TradingViewState createState() {
    return TradingViewState();
  }
}

class TradingViewState extends State<TradingView> {
  late WebViewController _con;
  final _detailController = Get.find<DetailController>();

  _loadHTML() async {
    _con.loadUrl(await _detailController.fetchTradingViewUri() ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder: (_) => WebView(
        initialUrl: '',
        javascriptMode: JavascriptMode.unrestricted,
        zoomEnabled: false,
        onWebViewCreated: (WebViewController webViewController) {
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
      ),
    );
  }
}
