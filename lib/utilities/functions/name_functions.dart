// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:money_manager/controller/provider/pageview/pageview_provider.dart';
import 'package:money_manager/utilities/functions/navigator_functions.dart';
import 'package:money_manager/view/navigation/screen_navigation.dart';
import 'package:money_manager/view/onboarding/screen_onboarding.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameFunctions {
  static void checkName(BuildContext context) async {
    final name =
        Provider.of<PageNotifier>(context, listen: false).nameConroller.text;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (name.isNotEmpty) {
      prefs.setString('name', name);
      NavigationFunctions.navigatePushReplacement(
          context, const ScreenNavigation());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please enter your name'),
        duration: Duration(seconds: 2),
      ));
    }
  }

  static void checkScreen(context) async {
    final data = await SharedPreferences.getInstance();
    final value = data.getString('name');
    if (value == null) {
      NavigationFunctions.navigatePushReplacement(
          context, const ScreenOnboarding());
    } else {
      NavigationFunctions.navigatePushReplacement(
          context, const ScreenNavigation());
    }
  }

  static Future getName(names) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var nameObtain = prefs.getString('name');
    names = nameObtain;
  }

  static timeControl() {
    DateTime timeCheck = DateTime.now();
    if (timeCheck.hour >= 0 && timeCheck.hour < 12) {
      return 'Good Morning,';
    } else if (timeCheck.hour >= 12 && timeCheck.hour < 16) {
      return 'Good Afternoon,';
    } else {
      return 'Good Evening,';
    }
  }
}
