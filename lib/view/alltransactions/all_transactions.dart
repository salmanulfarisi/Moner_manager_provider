import 'package:flutter/material.dart';
import 'package:money_manager/utilities/textstyles.dart';
import 'package:money_manager/view/alltransactions/widgets/alltransactions/alltransactions.dart';
import 'package:money_manager/view/alltransactions/widgets/expanse_transaction/expansetransactions.dart';
import 'package:money_manager/view/alltransactions/widgets/income_transactions/incometransaction.dart';

class ScreenAllTransaction extends StatelessWidget {
  const ScreenAllTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'All Transactions',
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
          AllTransactions(),
          IncomeTransactions(),
          ExpanseTrasactions(),
        ]),
      ),
    );
  }
}
