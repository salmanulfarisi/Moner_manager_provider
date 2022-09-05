import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_manager/controller/provider/themeprovidr.dart';
import 'package:money_manager/controller/provider/updatetransaction/update_transaction.dart';
import 'package:provider/provider.dart';

class EditDescription extends StatelessWidget {
  const EditDescription({Key? key}) : super(key: key);

  //final TextEditingController editCategoryControll = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final editProvider =
        Provider.of<UpdateTransactionProvider>(context, listen: false);
    // editCategoryControll.text = provider.updatedCategory.toString();
    //print(editedamount);
    return Container(
      width: 320,
      height: 60,
      decoration: BoxDecoration(
          color: themeProvider.themeMode == ThemeMode.dark
              ? Colors.grey[600]
              : Colors.grey[400],
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: themeProvider.themeMode == ThemeMode.dark
                  ? Colors.indigo
                  : Colors.green,
              child: const Icon(
                Icons.note,
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
                  controller: editProvider.updatedDescription,
                  onChanged: (val) {
                    editProvider.description = val;
                    //print(editedamount);
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    hintText: 'note',
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
