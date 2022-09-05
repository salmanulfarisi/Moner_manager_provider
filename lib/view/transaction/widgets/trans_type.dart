import 'package:flutter/material.dart';
import 'package:money_manager/controller/provider/addtransaction/add_transaction_provider.dart';
import 'package:money_manager/controller/provider/themeprovidr.dart';
import 'package:money_manager/utilities/colors.dart';
import 'package:provider/provider.dart';

class TransType extends StatelessWidget {
  const TransType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddTransactionProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Consumer(
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChoiceChip(
              label: Text(
                'Income',
                style: TextStyle(
                    color:
                        provider.types == 'Income' ? whiteColor : blackColor),
              ),
              selected: provider.types == 'Income' ? true : false,
              selectedColor: themeProvider.themeMode == ThemeMode.dark
                  ? Colors.indigo
                  : Colors.green,
              labelStyle: const TextStyle(color: whiteColor),
              onSelected: (val) {
                FocusManager.instance.primaryFocus?.unfocus();
                if (val) {
                  provider.type = 'Income';
                }
              },
            ),
            const SizedBox(
              width: 20,
            ),
            ChoiceChip(
              label: Text(
                'Expense',
                style: TextStyle(
                  color:
                      provider.types == 'Expense' ? Colors.white : Colors.black,
                ),
              ),
              selected: provider.types == 'Expense' ? true : false,
              selectedColor: themeProvider.themeMode == ThemeMode.dark
                  ? Colors.indigo
                  : Colors.green,
              labelStyle: const TextStyle(color: Colors.white),
              onSelected: (val) {
                FocusManager.instance.primaryFocus?.unfocus();
                if (val) {
                  provider.type = 'Expense';
                }
              },
            )
          ],
        );
      },
    );
  }
}
