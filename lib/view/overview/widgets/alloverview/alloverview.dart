import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:money_manager/controller/provider/alltransaction/alltrans_provider.dart';
import 'package:money_manager/controller/provider/database_provider.dart';
import 'package:money_manager/view/alltransactions/widgets/datefilter_widget.dart';
import 'package:money_manager/view/overview/widgets/chart/chart_logic.dart';
import 'package:money_manager/view/overview/widgets/chart/sf_chart.dart';
import 'package:provider/provider.dart';

class AllOverView extends StatelessWidget {
  const AllOverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DateFilterWidgets(),
          Expanded(
              child: chart2(context).isEmpty
                  ? Center(child: Lottie.asset("asset/no_data.json"))
                  : PieChart(chartData: chart2(context)))
        ],
      ),
    );
  }

  List<ChartData> chart2(context) {
    final allTransProvider =
        Provider.of<AllTransProvider>(context, listen: false);
    final provider = Provider.of<DataBaseProvider>(context);

    final List<ChartData> chartData = chartLogic(provider.transactionProvider);
    final List<ChartData> todayChartData = chartLogic(provider
        .transactionProvider
        .where((element) =>
            DateFormat.yMMMMd().format(element.date) ==
            DateFormat.yMMMMd().format(DateTime.now()))
        .toList());
    final List<ChartData> yesterDayChart = chartLogic(provider
        .transactionProvider
        .where((element) =>
            DateFormat.yMMMMd().format(element.date) ==
            DateFormat.yMMMMd()
                .format(DateTime.now().subtract(const Duration(days: 1))))
        .toList());
    final List<ChartData> weeekChart = chartLogic(provider.transactionProvider
        .where((element) => element.date
            .isAfter(DateTime.now().subtract(const Duration(days: 7))))
        .toList());
    final List<ChartData> monthChart = chartLogic(provider.transactionProvider
        .where((element) => element.date
            .isAfter(DateTime.now().subtract(const Duration(days: 30))))
        .toList());

    if (allTransProvider.dropDownVlaue == "All") {
      return chartData;
    } else if (allTransProvider.dropDownVlaue == "Today") {
      return todayChartData;
    } else if (allTransProvider.dropDownVlaue == "Yesterday") {
      return yesterDayChart;
    } else if (allTransProvider.dropDownVlaue == "Last 7 Days") {
      return weeekChart;
    } else if (allTransProvider.dropDownVlaue == "Last 30 Days") {
      return monthChart;
    } else {
      return chartData;
    }
  }
}
