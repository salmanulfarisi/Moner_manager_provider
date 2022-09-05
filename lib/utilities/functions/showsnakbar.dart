import 'package:flutter/material.dart';

class ShowSnackBar {
  static void showSnackBarFail(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        content: Text('Please fill all the fields'),
        backgroundColor: Colors.red,
      ),
    );
  }

  static void showSnackBarSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        content: Text(
          'Successfully added',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
