import 'package:flutter/material.dart';
import 'package:money_manager/controller/provider/themeprovidr.dart';
import 'package:provider/provider.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  const ButtonWidget({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: themeprovider.themeMode == ThemeMode.dark
              ? Colors.indigo
              : Colors.green,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          minimumSize: const Size(150, 40)),
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: TextStyle(
            color: themeprovider.themeMode == ThemeMode.dark
                ? Colors.white
                : Colors.black),
      ),
    );
  }
}
