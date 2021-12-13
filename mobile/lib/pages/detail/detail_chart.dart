import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DetailChart extends StatelessWidget {
  List<_SalesData> data = [
    _SalesData('11.30', 35),
    _SalesData('12.01', 28),
    _SalesData('12.02', 34),
    _SalesData('12.03', -32),
    _SalesData('12.04', 40),
    _SalesData('12.05', -10),
    _SalesData('12.06', -50),
    _SalesData('12.07', -60),
    _SalesData('12.08', -70),
    _SalesData('12.09', 10),
    _SalesData('12.10', 40),
    _SalesData('12.11', 40),
    _SalesData('12.12', 40),
    _SalesData('12.13', 40),
    _SalesData('12.14', 40),
    _SalesData('12.15', 40),
    _SalesData('12.16', 40),
    _SalesData('12.17', 40),
  ];

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
        series: <ChartSeries<_SalesData, String>>[
          SplineSeries<_SalesData, String>(
            dataLabelSettings: DataLabelSettings(isVisible: false),
            dataSource: data,
            color: Colors.black38,
            isVisible: true,
            isVisibleInLegend: false,
            enableTooltip: true,
            xValueMapper: (_SalesData sales, _) => sales.year,
            yValueMapper: (_SalesData sales, _) => sales.sales,
            name: 'Sales',
          )
        ]);
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
