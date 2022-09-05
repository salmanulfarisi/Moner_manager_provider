import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'chart_logic.dart';

class PieChart extends StatelessWidget {
  final List<ChartData>? chartData;
  const PieChart({Key? key, required this.chartData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      legend: Legend(
          position: LegendPosition.auto,
          isResponsive: true,
          isVisible: true,
          // textStyle: const TextStyle(color: blackColor),
          alignment: ChartAlignment.center,
          overflowMode: LegendItemOverflowMode.wrap),
      series: <CircularSeries>[
        PieSeries<ChartData, String>(
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            labelPosition: ChartDataLabelPosition.inside,
            textStyle: TextStyle(fontSize: 10),
          ),
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.categoreis,
          yValueMapper: (ChartData data, _) => data.amount,
          explode: true,
          explodeAll: true,
          explodeIndex: 3,
        ),
      ],
    );
  }
}
