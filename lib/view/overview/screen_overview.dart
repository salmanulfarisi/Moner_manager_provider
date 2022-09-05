import 'package:flutter/material.dart';
import 'package:money_manager/utilities/textstyles.dart';
import 'package:money_manager/view/overview/widgets/alloverview/alloverview.dart';
import 'package:money_manager/view/overview/widgets/expense_overview/expense_overview.dart';
import 'package:money_manager/view/overview/widgets/income_overview/income_overview.dart';

class ScreenOverView extends StatelessWidget {
  const ScreenOverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Overview',
            style: poppinsStyleDark,
          ),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(
              text: 'All',
            ),
            Tab(
              text: 'Income',
            ),
            Tab(
              text: 'Expense',
            ),
          ]),
        ),
        body: const TabBarView(children: [
          AllOverView(),
          IncomeOverView(),
          ExpenseOverView(),
        ]),
      ),
    );
  }
}
