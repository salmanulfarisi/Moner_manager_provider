// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:money_manager/controller/provider/alltransaction/alltrans_provider.dart';
import 'package:money_manager/controller/provider/database_provider.dart';
import 'package:money_manager/controller/provider/themeprovidr.dart';
import 'package:money_manager/utilities/colors.dart';
import 'package:provider/provider.dart';

class DateFilterWidgets extends StatelessWidget {
  const DateFilterWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<AllTransProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      width: size.width * 0.4,
      height: size.height * 0.075,
      decoration: BoxDecoration(
        color: themeProvider.themeMode == ThemeMode.dark
            ? Colors.indigo
            : Colors.green,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
          child: Consumer<AllTransProvider>(builder: ((context, value, child) {
        return DropdownButtonFormField(
            hint: Text(provider.dropDownVlaue),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: blackColor),
                borderRadius: BorderRadius.circular(30),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: blackColor),
                borderRadius: BorderRadius.circular(30),
              ),
              fillColor: Colors.white60,
              filled: true,
            ),
            items: value.dateFilter.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              );
            }).toList(),
            onChanged: (String? value) {
              provider.dropDownVlaue = value!;
              Provider.of<DataBaseProvider>(context, listen: false)
                  .notifyListeners();
            });
      }))),
    );
  }
}
