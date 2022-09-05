import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:money_manager/controller/provider/addtransaction/add_transaction_provider.dart';
import 'package:money_manager/controller/provider/database_provider.dart';
import 'package:money_manager/controller/provider/themeprovidr.dart';
import 'package:money_manager/utilities/functions/navigator_functions.dart';
import 'package:money_manager/utilities/functions/settings_functions.dart';
import 'package:money_manager/utilities/textstyles.dart';
import 'package:money_manager/view/update/update_transaction.dart';
import 'package:provider/provider.dart';

class ExpanseTrasactions extends StatelessWidget {
  const ExpanseTrasactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddTransactionProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<DataBaseProvider>(
          builder: (context, value, child) {
            return value.transactionProvider
                    .where((element) => element.type == 'Expense')
                    .toList()
                    .isEmpty
                ? Center(child: Lottie.asset('asset/no_data.json'))
                : ListView.builder(
                    itemCount: value.transactionProvider.length,
                    itemBuilder: (ctx, index) {
                      final data = value.transactionProvider[index];
                      return data.type == 'Expense'
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
                              title: Text(data.category,
                                  style:
                                      themeProvider.themeMode == ThemeMode.dark
                                          ? poppinsStyleDark
                                          : poppinsStyleLight),
                              subtitle: Text(
                                  '${data.date.day} ${provider.monthName}'),
                              trailing: Text('${data.amount}',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: data.type == "Income"
                                            ? Colors.green
                                            : Colors.red),
                                  )),
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
        ));
  }
}
