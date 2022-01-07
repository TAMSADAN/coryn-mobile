import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:mobile/models/dto/price.dart';
import 'package:mobile/models/chart.dart';

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
            dataSource: chartList,
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
}

class _ChartData {
  _ChartData(this.date, this.price);

  final String date;
  final int price;
}
