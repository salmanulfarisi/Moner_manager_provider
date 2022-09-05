import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/controller/provider/updatetransaction/update_transaction.dart';
import 'package:money_manager/model/transaction_model/transaction_model.dart';
import 'package:money_manager/utilities/colors.dart';
import 'package:money_manager/utilities/sizes.dart';
import 'package:money_manager/view/transaction/widgets/date_picker.dart';
import 'package:money_manager/view/update/widgets/button_widgets.dart';
import 'package:money_manager/view/update/widgets/update_category.dart.dart';
import 'package:money_manager/view/update/widgets/update_amount.dart';
import 'package:money_manager/view/update/widgets/update_description.dart';
import 'package:provider/provider.dart';

class ScreenUpdate extends StatelessWidget {
  const ScreenUpdate({Key? key, required this.data}) : super(key: key);
  final TransactionModel data;
  @override
  Widget build(BuildContext context) {
    final editProvider =
        Provider.of<UpdateTransactionProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      editProvider.updatedAmount.text = data.amount.toString();
      editProvider.updatedCategory.text = data.category;
      editProvider.updatedDescription.text = data.description;
      editProvider.showDate = data.date;
      editProvider.showType = data.type;
    });
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: blackColor,
        ),
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
                        "Update Transaction",
                        style: GoogleFonts.signika(
                          textStyle: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                      heightSizedBox(30.0),
                      TextButton.icon(
                          onPressed: () {
                            editProvider.selectDate(context);
                          },
                          icon: const Icon(
                            Icons.calendar_month,
                            color: whiteColor,
                          ),
                          label: Consumer<UpdateTransactionProvider>(
                              builder: (context, value, child) => Text(
                                    '${value.showDate.day}-${value.showDate.month}-${value.showDate.year}',
                                    style: const TextStyle(color: whiteColor),
                                  ))),
                      heightSizedBox(30.0),
                      const EditAmountWidget(),
                      heightSizedBox(30.0),
                      EditCategory(),
                      heightSizedBox(30.0),
                      const EditDescription(),
                      heightSizedBox(30.0),
                      ButtonWidget(
                        text: 'Save',
                        onPressed: () {
                          editProvider.updateSubmission(
                              context, data.id.toString(), data);
                        },
                      )
                      // const DatePickerWidget()
                    ],
                  ),
                ),
              )),
        ));
  }
}
