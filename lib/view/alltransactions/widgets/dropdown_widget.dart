import 'package:flutter/material.dart';
import 'package:money_manager/controller/provider/alltransaction/alltrans_provider.dart';
import 'package:money_manager/utilities/colors.dart';
import 'package:provider/provider.dart';

class DropdownWidgets extends StatelessWidget {
  const DropdownWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<AllTransProvider>(context);
    return Container(
      width: size.width * 0.4,
      height: size.height * 0.07,
      decoration: BoxDecoration(
        color: orangeColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
          child: Consumer<AllTransProvider>(builder: ((context, value, child) {
        return DropdownButtonFormField(
            hint: Text(provider.dropDownVlaue),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: blackColor, width: 2),
                borderRadius: BorderRadius.circular(30),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: blackColor, width: 2),
                borderRadius: BorderRadius.circular(30),
              ),
              fillColor: Colors.white60,
              filled: true,
            ),
            items: value.items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            onChanged: (String? value) {
              provider.dropDownVlaue = value!;
            });
      }))),
    );
  }
}
