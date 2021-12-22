import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:mobile/models/dto/price.dart';
import 'package:mobile/models/chart.dart';

class DetailChart extends StatelessWidget {
  final List<Chart> chartList;

  DetailChart({Key? key, required this.chartList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("detail_chart");
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
