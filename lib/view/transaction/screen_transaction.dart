import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/controller/provider/addtransaction/add_transaction_provider.dart';
import 'package:money_manager/utilities/colors.dart';
import 'package:money_manager/utilities/functions/navigator_functions.dart';
import 'package:money_manager/utilities/sizes.dart';
import 'package:money_manager/view/transaction/widgets/amount_widget.dart';
import 'package:money_manager/view/transaction/widgets/category_widgets.dart';
import 'package:money_manager/view/transaction/widgets/discription_widget.dart';
import 'package:money_manager/view/transaction/widgets/trans_type.dart';
import 'package:provider/provider.dart';

class ScreenTransaction extends StatelessWidget {
  const ScreenTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<AddTransactionProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: blackColor),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  heightSizedBox(40.0),
                  Text(
                    "Add Transaction",
                    style: GoogleFonts.signika(
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ),
                  heightSizedBox(30.0),
                  TextButton.icon(
                      onPressed: () {
                        provider.selectDate(context);
                      },
                      icon: const Icon(
                        Icons.calendar_month,
                        color: whiteColor,
                      ),
                      label: Consumer<AddTransactionProvider>(
                          builder: (context, value, child) => Text(
                                '${value.date.day}-${value.date.month}-${value.date.year}',
                                style: const TextStyle(color: whiteColor),
                              ))),
                  heightSizedBox(30.0),
                  const AmountWidget(),
                  heightSizedBox(20.0),
                  CategoryWidgets(),
                  heightSizedBox(20.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: TransType(),
                  ),
                  heightSizedBox(20.0),
                  // const DatePickerWidget(),
                  heightSizedBox(20.0),
                  const DescriptionWidgets(),
                  heightSizedBox(20.0),
                  ElevatedButton(
                    onPressed: () {
                      provider.addTransaction(context);
                      NavigationFunctions.navigatePop(context);
                    },
                    child: const Text("Add Transaction"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
