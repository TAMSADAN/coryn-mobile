// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class TradingView extends StatefulWidget {
//   const TradingView({Key? key}) : super(key: key);

//   @override
//   _TradingViewState createState() => _TradingViewState();
// }

// class _TradingViewState extends State<TradingView> {
//   List<WebViewController> _listController = [];
//   List<double> _heights =
//       List<double>.generate(htmlStrings.length, (int index) => 20.0);

//   @override
//   Widget build(BuildContext context) {
//     return WebView(
//       initialUrl:
//           'data:text/html;base64,${base64Encode(const Utf8Encoder().convert(htmlStrings[index]))}',
//       onPageFinished: (some) async {
//         double height = double.parse(await _listController[index]
//             .evaluateJavascript("document.documentElement.scrollHeight;"));
//         setState(() {
//           _heights[index] = height;
//         });
//       },
//       javascriptMode: JavascriptMode.unrestricted,
//       onWebViewCreated: (controller) async {
//         _listController.add(controller);
//       },
//     );
//   }
// }
