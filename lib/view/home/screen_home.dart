import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:money_manager/controller/database/db_functions.dart';
import 'package:money_manager/controller/provider/addtransaction/add_transaction_provider.dart';
import 'package:money_manager/controller/provider/database_provider.dart';
import 'package:money_manager/controller/provider/themeprovidr.dart';
import 'package:money_manager/utilities/functions/name_functions.dart';
import 'package:money_manager/utilities/functions/settings_functions.dart';
import 'package:money_manager/utilities/textstyles.dart';
import 'package:money_manager/view/home/widgets/round_container.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = '';
    final provider = Provider.of<AddTransactionProvider>(context);
    final providerDatabase = Provider.of<DataBaseProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    List<double> amount = providerDatabase.totalStatistics();
    WidgetsBinding.instance.addTimingsCallback((_) {
      NameFunctions.getName(name);
      TransactionDB.instance.refreshUi(context);
    });
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  NameFunctions.timeControl(),
                  style: themeProvider.themeMode == ThemeMode.dark
                      ? poppinsStyleDark
                      : poppinsStyleLight,
                ),
                Text(name),
              ],
            ),
          ),
          RoundContainer(totalExpense: amount[2], totalIncome: amount[1]),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Recent Transactions",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Expanded(child: Consumer<DataBaseProvider>(
            builder: ((context, value, child) {
              return value.transactionProvider.isEmpty
                  ? Lottie.asset('asset/no_data.json')
                  : ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final data = value.transactionProvider[index];
                        return ListTile(
                          onLongPress: () {
                            SettingsFunctions.showDeleteDialoge(
                                context, data.id);
                          },
                          leading: data.type == "Income"
                              ? const CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child: Icon(
                                    Icons.arrow_upward,
                                    color: Colors.white,
                                  ),
                                )
                              : const CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Icon(
                                    Icons.arrow_downward,
                                    color: Colors.white,
                                  ),
                                ),
                          title: Text(data.category,
                              style: themeProvider.themeMode == ThemeMode.dark
                                  ? poppinsStyleDark
                                  : poppinsStyleLight),
                          subtitle:
                              Text('${data.date.day} ${provider.monthName}'),
                          trailing: Column(
                            children: [
                              Text(
                                '${data.amount}',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: data.type == "Income"
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                              ),
                              Text(
                                data.type,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: data.type == "Income"
                                        ? Colors.green
                                        : Colors.red),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: value.transactionProvider.length < 5
                          ? value.transactionProvider.length
                          : 5,
                    );
            }),
          ))
        ],
      ),
    );
  }
}
