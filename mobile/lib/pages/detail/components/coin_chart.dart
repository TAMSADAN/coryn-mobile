import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile/pages/detail/controllers/detail_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:mobile/models/chart.dart';

class DetailChart extends StatelessWidget {
  DetailChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      builder: (_) => _.fetchingChart
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : SfCartesianChart(
              primaryXAxis: CategoryAxis(
                majorGridLines: const MajorGridLines(width: 0),
              ),
              primaryYAxis: CategoryAxis(
                majorGridLines: const MajorGridLines(width: 0),
                isVisible: false,
              ),
              plotAreaBorderWidth: 0,
              legend: Legend(isVisible: false),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<Chart, String>>[
                SplineSeries<Chart, String>(
                  dataLabelSettings: const DataLabelSettings(isVisible: false),
                  dataSource: _.normalizeChartList(_.chartList),
                  color: Colors.black38,
                  isVisible: true,
                  isVisibleInLegend: false,
                  enableTooltip: true,
                  xValueMapper: (Chart chart, _) => chart.date,
                  yValueMapper: (Chart chart, _) => chart.price,
                  name: 'Price',
                ),
              ],
            ),
    );
  }
}
