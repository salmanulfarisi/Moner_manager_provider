import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_manager/controller/provider/addtransaction/add_transaction_provider.dart';
import 'package:money_manager/controller/provider/themeprovidr.dart';
import 'package:money_manager/view/transaction/widgets/suggetions_widget.dart';
import 'package:provider/provider.dart';

class CategoryWidgets extends StatelessWidget {
  CategoryWidgets({Key? key}) : super(key: key);

  final SuggestionList suggestionList = SuggestionList();
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final provider =
        Provider.of<AddTransactionProvider>(context, listen: false);
    return Container(
      width: 320,
      height: 60,
      decoration: BoxDecoration(
        color: themeProvider.themeMode == ThemeMode.dark
            ? Colors.grey[600]
            : Colors.grey[400],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: themeProvider.themeMode == ThemeMode.dark
                  ? Colors.indigo
                  : Colors.green,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                width: 210,
                height: 60,
                child: TextField(
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  onChanged: (val) {
                    provider.category = provider.categoryController.text;
                  },
                  controller: provider.categoryController,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    hintText: 'Category',
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
