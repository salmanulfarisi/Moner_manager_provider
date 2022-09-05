import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:money_manager/controller/provider/database_provider.dart';
import 'package:money_manager/view/overview/widgets/chart/chart_logic.dart';
import 'package:money_manager/view/overview/widgets/chart/sf_chart.dart';
import 'package:provider/provider.dart';

class ExpenseOverView extends StatelessWidget {
  const ExpenseOverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: chart2(context).isEmpty
                  ? Center(child: Lottie.asset("asset/no_data.json"))
                  : PieChart(chartData: chart2(context)))
        ],
      ),
    );
  }

  List<ChartData> chart2(context) {
    // final allTransProvider =
    //     Provider.of<AllTransProvider>(context, listen: false);
    final provider = Provider.of<DataBaseProvider>(context);
    final List<ChartData> chartData = chartLogic(provider.transactionProvider
        .where((element) => element.type == 'Expense')
        .toList());
    return chartData;
  }
}
