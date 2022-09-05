import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:money_manager/controller/database/db_functions.dart';
import 'package:money_manager/utilities/colors.dart';
import 'package:money_manager/utilities/functions/navigator_functions.dart';
import 'package:money_manager/view/settings/widgets/notification.dart';
import 'package:money_manager/view/spalsh/screen_splash.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsFunctions {
  static showReset(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Reset App'),
          content: const Text('Are you sure you want to reset the app?'),
          actions: [
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: const Text('Reset'),
              onPressed: () async {
                TransactionDB.instance.resetApp();

                NavigationFunctions.navigatePushandRemoveUntil(
                    context, const ScreenSplash());
              },
            ),
          ],
        );
      },
    );
  }

  static showAbout(context) {
    showAboutDialog(
        context: context,
        applicationName: 'WalletX',
        applicationVersion: 'v1.0.0',
        applicationIcon: Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'asset/undraw_Credit_card_payments_re_qboh-removebg-preview.png'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
            )),
        applicationLegalese: '© 2020-2021 All rights reserved.',
        children: [
          const Text(' WalletX is a Money Manager app '
              'that Manage your Daily Expense.'),
          const Text(
            'This app is made with ❤️ by '
            '${'Salman'}',
          ),
        ]);
  }

  static Future<void> aboutMe() async {
    // ignore: deprecated_member_use
    if (await launch('https://salmanulfarisi.github.io/portfolio/')) {
      throw "Try Again";
    }
  }

  static Future<void> mailToMe() async {
    // ignore: deprecated_member_use
    if (await launch('mailto:salmanfarisi0027@gmail.com')) {
      throw "Try Again";
    }
  }

  static Future<void> ratingApp() async {
    // ignore: deprecated_member_use
    if (await launch(
        'https://play.google.com/store/apps/details?id=com.beats.beats')) {
      throw "Try Again";
    }
  }

  static timePicking(context) async {
    TimeOfDay currentTime = TimeOfDay.now();
    final TimeOfDay? pickedTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != currentTime) {
      NotificationApi.showScheduledNotification(
          title: 'WalletX',
          body: "Don't Forget to add your Transaction",
          scheduledDate: Time(pickedTime.hour, pickedTime.minute));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 1),
          content: Text(
            'Successfully set reminder for  ${pickedTime.hour > 12 ? pickedTime.hour - 12 : pickedTime.hour} : ${pickedTime.minute < 10 ? '0${pickedTime.minute}' : pickedTime.minute} ${pickedTime.hour < 12 ? 'AM' : 'PM'}',
            style: const TextStyle(color: blackColor),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  static showDeleteDialoge(BuildContext context, id) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text(
              'Delete',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: const Text('Are you sure to Delete?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('No')),
              TextButton(
                  onPressed: () {
                    TransactionDB.instance.deleteTransaction(id, context);

                    Navigator.pop(context);
                  },
                  child: const Text('Yes')),
            ],
          );
        });
  }
}
