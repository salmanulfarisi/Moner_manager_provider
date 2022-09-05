import 'package:flutter/material.dart';
import 'package:money_manager/controller/database/db_functions.dart';
import 'package:money_manager/controller/provider/alltransaction/alltrans_provider.dart';
import 'package:money_manager/controller/provider/database_provider.dart';
import 'package:money_manager/utilities/colors.dart';
import 'package:money_manager/utilities/sizes.dart';
import 'package:money_manager/view/alltransactions/widgets/alltransactions/datefilter/alltrans.dart';
import 'package:money_manager/view/alltransactions/widgets/alltransactions/datefilter/lastweek_month.dart';
import 'package:money_manager/view/alltransactions/widgets/alltransactions/datefilter/today.dart';
import 'package:money_manager/view/alltransactions/widgets/alltransactions/datefilter/yesterday.dart';
import 'package:money_manager/view/alltransactions/widgets/datefilter_widget.dart';
import 'package:provider/provider.dart';

class AllTransactions extends StatelessWidget {
  const AllTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<AllTransProvider>(context, listen: false);
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const DateFilterWidgets(),
                widthSizedBox(size.width * 0.1),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.calendar_month,
                      color: blackColor,
                    ),
                    label: const Text(
                      'Select Month',
                      style: TextStyle(color: blackColor),
                    )),
              ],
            ),
            const SizedBox(height: 16),
            Consumer<DataBaseProvider>(builder: (context, value, child) {
              return Expanded(
                  child: provider.dropDownVlaue == 'All'
                      ? const AllTrans()
                      : provider.dropDownVlaue == 'Today'
                          ? const TodayDateTrans()
                          : provider.dropDownVlaue == 'Yesterday'
                              ? const YesterdayDateTrans()
                              : provider.dropDownVlaue == 'Last 7 Days'
                                  ? const LastMonthWeek(
                                      day: 7,
                                    )
                                  : provider.dropDownVlaue == 'Last 30 Days'
                                      ? const LastMonthWeek(
                                          day: 30,
                                        )
                                      : const SizedBox());
            }),
          ],
        ),
      ),
    );
  }
}
