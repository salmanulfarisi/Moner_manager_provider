import 'package:flutter/material.dart';

class NavigationFunctions {
  static navigatePushReplacement(context, page) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => page));
  }

  static navigatePush(context, page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => page));
  }

  static navigatePop(context) {
    Navigator.of(context).pop();
  }

  static navigatePushandRemoveUntil(context, page) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => page), (route) => false);
  }
}
