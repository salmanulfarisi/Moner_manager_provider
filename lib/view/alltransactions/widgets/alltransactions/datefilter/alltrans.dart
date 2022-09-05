import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:money_manager/controller/provider/addtransaction/add_transaction_provider.dart';
import 'package:money_manager/controller/provider/database_provider.dart';
import 'package:money_manager/controller/provider/themeprovidr.dart';
import 'package:money_manager/controller/provider/updatetransaction/update_transaction.dart';
import 'package:money_manager/utilities/functions/navigator_functions.dart';
import 'package:money_manager/utilities/functions/settings_functions.dart';
import 'package:money_manager/utilities/textstyles.dart';
import 'package:money_manager/view/update/update_transaction.dart';
import 'package:provider/provider.dart';

class AllTrans extends StatelessWidget {
  const AllTrans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddTransactionProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Consumer<DataBaseProvider>(
      builder: (context, value, child) {
        return value.transactionProvider.isEmpty
            ? Lottie.asset('asset/no_data.json')
            : ListView.builder(
                itemCount: value.transactionProvider.length,
                itemBuilder: (context, index) {
                  final data = value.transactionProvider[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          data.type == 'Income' ? Colors.green : Colors.red,
                      child: Center(
                          child: Text(data.category[0],
                              style: themeProvider.themeMode == ThemeMode.dark
                                  ? poppinsStyleDark
                                  : poppinsStyleLight)),
                    ),
                    title: Text(
                      data.category,
                      style: themeProvider.themeMode == ThemeMode.dark
                          ? poppinsStyleDark
                          : poppinsStyleLight,
                    ),
                    subtitle: Text('${data.date.day} ${provider.monthName}'),
                    trailing: Text(
                      '${data.amount}',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: data.type == "Income"
                                  ? Colors.green
                                  : Colors.red)),
                    ),
                    onLongPress: () {
                      SettingsFunctions.showDeleteDialoge(context, data.id);
                    },
                    onTap: () {
                      NavigationFunctions.navigatePush(
                          context,
                          ScreenUpdate(
                            data: data,
                          ));
                    },
                  );
                });
      },
    );
  }
}
