import 'package:flutter/material.dart';
import 'package:money_manager/controller/provider/bottom_navigation_provider.dart';
import 'package:money_manager/controller/provider/themeprovidr.dart';
import 'package:money_manager/utilities/colors.dart';
import 'package:money_manager/utilities/functions/navigator_functions.dart';
import 'package:money_manager/view/alltransactions/all_transactions.dart';
import 'package:money_manager/view/home/screen_home.dart';
import 'package:money_manager/view/overview/screen_overview.dart';
import 'package:money_manager/view/settings/settings_page.dart';
import 'package:money_manager/view/transaction/screen_transaction.dart';
import 'package:provider/provider.dart';

class ScreenNavigation extends StatelessWidget {
  const ScreenNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomNavigationProvider =
        Provider.of<BottomNavigatorProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final pages = [
      const ScreenHome(),
      const ScreenAllTransaction(),
      const ScreenTransaction(),
      const ScreenOverView(),
      const ScreenSettings()
    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 1),
          child: FloatingActionButton(
            backgroundColor: themeProvider.themeMode == ThemeMode.dark
                ? Colors.indigo
                : Colors.green,
            onPressed: () {
              NavigationFunctions.navigatePush(
                  context, const ScreenTransaction());
            },
            child: const Icon(Icons.add, color: whiteColor),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Stack(
          children: [
            pages[bottomNavigationProvider.index],
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: const Alignment(0.0, 1.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: themeProvider.themeMode == ThemeMode.dark
                        ? Colors.indigo
                        : Colors.green,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    currentIndex: bottomNavigationProvider.index,
                    onTap: (index) {
                      bottomNavigationProvider.currentIndex = index;
                    },
                    backgroundColor: Colors.black12,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.home,
                            size: 30,
                          ),
                          label: ""),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.list,
                            size: 30,
                          ),
                          label: ""),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.add,
                            size: 30,
                          ),
                          label: ""),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.bar_chart,
                            size: 30,
                          ),
                          label: ""),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.settings,
                          size: 30,
                        ),
                        label: "",
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
