import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:money_manager/controller/provider/addtransaction/add_transaction_provider.dart';
import 'package:money_manager/controller/provider/database_provider.dart';
import 'package:money_manager/controller/provider/themeprovidr.dart';
import 'package:money_manager/utilities/functions/navigator_functions.dart';
import 'package:money_manager/utilities/functions/settings_functions.dart';
import 'package:money_manager/utilities/textstyles.dart';
import 'package:money_manager/view/update/update_transaction.dart';
import 'package:provider/provider.dart';

class YesterdayDateTrans extends StatelessWidget {
  const YesterdayDateTrans({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final provider = Provider.of<AddTransactionProvider>(context);
    return Consumer<DataBaseProvider>(
      builder: (context, value, child) {
        return value.transactionProvider
                .where((element) =>
                    DateFormat.yMMMMd().format(element.date) ==
                    DateFormat.yMMMMd().format(
                        DateTime.now().subtract(const Duration(days: 1))))
                .toList()
                .isEmpty
            ? Lottie.asset('asset/no_data.json')
            : ListView.builder(
                itemCount: value.transactionProvider.length,
                itemBuilder: (ctx, index) {
                  final data = value.transactionProvider[index];
                  return DateFormat.MMMMd().format(data.date) ==
                          DateFormat.MMMMd().format(
                              DateTime.now().subtract(const Duration(days: 1)))
                      ? ListTile(
                          leading: CircleAvatar(
                            backgroundColor: data.type == 'Income'
                                ? Colors.green
                                : Colors.red,
                            child: Center(
                                child: Text(data.category[0],
                                    style: themeProvider.themeMode ==
                                            ThemeMode.dark
                                        ? poppinsStyleDark
                                        : poppinsStyleLight)),
                          ),
                          title: Text(data.category),
                          subtitle:
                              Text('${data.date.day} ${provider.monthName}'),
                          trailing: Text(
                            '${data.amount}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: data.type == "Income"
                                    ? Colors.green
                                    : Colors.red),
                          ),
                          onLongPress: () {
                            SettingsFunctions.showDeleteDialoge(
                                context, data.id);
                          },
                          onTap: () {
                            NavigationFunctions.navigatePush(
                                context,
                                ScreenUpdate(
                                  data: data,
                                ));
                          },
                        )
                      : const SizedBox();
                });
      },
    );
  }
}
