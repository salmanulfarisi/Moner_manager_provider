import 'package:flutter/material.dart';
import 'package:money_manager/utilities/colors.dart';
import 'package:money_manager/utilities/functions/name_functions.dart';

class LastpageButton extends StatelessWidget {
  const LastpageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        NameFunctions.checkName(context);
      },
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        primary: Colors.white,
        backgroundColor: greenColor,
        minimumSize: const Size.fromHeight(80),
      ),
      child: const Text(
        'Get Started',
        style: TextStyle(
          color: whiteColor,
          fontSize: 20,
        ),
      ),
    );
  }
}
