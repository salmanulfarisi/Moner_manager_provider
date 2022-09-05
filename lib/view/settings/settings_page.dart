import 'package:flutter/material.dart';
import 'package:money_manager/controller/provider/themeprovidr.dart';
import 'package:money_manager/utilities/functions/settings_functions.dart';
import 'package:money_manager/view/settings/widgets/notification.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:share_plus/share_plus.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    void listenNotifications() => NotificationApi.onNotifications;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      NotificationApi.init(initScheduled: true);
      listenNotifications();
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.notifications),
                title: const Text('Set Notifications'),
                trailing: const Icon(Icons.arrow_right),
                onPressed: (context) {
                  SettingsFunctions.timePicking(context);
                },
              ),
              SettingsTile.navigation(
                leading: provider.themeMode == ThemeMode.dark
                    ? const Icon(Icons.brightness_2)
                    : const Icon(Icons.sunny),
                title: provider.themeMode == ThemeMode.dark
                    ? const Text('Dark Mode')
                    : const Text('Light Mode'),
                trailing: Switch(
                    value: provider.themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      provider.toggleTheme(value);
                    }),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.mail),
                title: const Text('Contact me'),
                onPressed: (context) {
                  SettingsFunctions.mailToMe();
                },
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.share),
                title: const Text('Share'),
                onPressed: (context) async {
                  await Share.share('text');
                },
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.delete),
                title: const Text('Reset App'),
                onPressed: (context) {
                  SettingsFunctions.showReset(context);
                },
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.person),
                title: const Text('About Developer'),
                onPressed: (context) {
                  SettingsFunctions.aboutMe();
                },
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.star_border_outlined),
                title: const Text('Rate My App'),
                onPressed: (context) {
                  SettingsFunctions.ratingApp();
                },
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.info),
                title: const Text('About App'),
                value: const Text('v1.0.0'),
                onPressed: (context) {
                  SettingsFunctions.showAbout(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
