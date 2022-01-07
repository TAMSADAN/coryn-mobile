import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:mobile/models/dto/price.dart';
import 'package:mobile/models/chart.dart';
import 'dart:math';

/*
  [component] DetailChart

  info
  코인 차트 컴포넌트 입니다.
  사용자는 차트를 확인할 수 있습니다.

  contents
  - 차트

  events
  - 

  etc
  -
*/

class DetailChart extends StatelessWidget {
  final List<Chart> chartList;

  DetailChart({Key? key, required this.chartList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late List<Chart> _chartList = _normalizeChartList(chartList);

    return SfCartesianChart(
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
        ),
        primaryYAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          isVisible: false,
        ),
        plotAreaBorderWidth: 0,
        legend: Legend(isVisible: false),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries<Chart, String>>[
          SplineSeries<Chart, String>(
            dataLabelSettings: DataLabelSettings(isVisible: false),
            dataSource: _chartList,
            color: Colors.black38,
            isVisible: true,
            isVisibleInLegend: false,
            enableTooltip: true,
            xValueMapper: (Chart chart, _) => chart.date,
            yValueMapper: (Chart chart, _) => chart.price,
            name: 'Price',
          )
        ]);
  }

  List<Chart> _normalizeChartList(List<Chart> chartList) {
    List<Chart> _normalizedChartList = [];
    List<double> _priceList;
    double _normalizedPrice;
    double _maxPrice;
    double _minPrice;

    _priceList =
        List.generate(chartList.length, (index) => chartList[index].price);
    _priceList.sort();
    _minPrice = _priceList.first;
    _maxPrice = _priceList.last;

    for (var chart in chartList) {
      _normalizedPrice = (chart.price - _minPrice) / (_maxPrice - _minPrice);
      _normalizedPrice = _normalizedPrice * 100 + 10;
      _normalizedChartList
          .add(Chart(date: chart.date, price: _normalizedPrice));
    }

    return _normalizedChartList;
  }
}
