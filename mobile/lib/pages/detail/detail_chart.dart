import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:mobile/models/dto/price.dart';

class DetailChart extends StatelessWidget {
  final List<Price> priceList;

  DetailChart({Key? key, required this.priceList}) : super(key: key);

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
        series: <ChartSeries<Price, String>>[
          SplineSeries<Price, String>(
            dataLabelSettings: DataLabelSettings(isVisible: false),
            dataSource: priceList,
            color: Colors.black38,
            isVisible: true,
            isVisibleInLegend: false,
            enableTooltip: true,
            xValueMapper: (Price price, _) => price.timestamp.toString(),
            yValueMapper: (Price price, _) => price.openingPrice,
            name: 'Price',
          )
        ]);
  }
}

// class _PriceData {
//   _PriceData(this.timestamp, this.price);

//   final String timestamp;
//   final double price;
// }
