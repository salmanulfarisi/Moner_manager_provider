import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:money_manager/controller/database/db_functions.dart';
import 'package:money_manager/utilities/colors.dart';
import 'package:money_manager/utilities/functions/name_functions.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(
          const Duration(seconds: 3), () => NameFunctions.checkScreen(context));
      TransactionDB.instance.refreshUi(context);
    });

    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('asset/lottie.json'),
            const Text(
              'Money Manager',
              style: TextStyle(
                color: blackColor,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
