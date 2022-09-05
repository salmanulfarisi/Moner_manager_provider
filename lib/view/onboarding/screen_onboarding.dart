import 'package:flutter/material.dart';
import 'package:money_manager/controller/provider/pageview/pageview_provider.dart';
import 'package:money_manager/view/onboarding/widgets/buildpage.dart';
import 'package:money_manager/view/onboarding/widgets/lastpage.dart';
import 'package:money_manager/view/onboarding/widgets/lastpagebutton.dart';
import 'package:money_manager/view/onboarding/widgets/onboard_button.dart';
import 'package:provider/provider.dart';

class ScreenOnboarding extends StatelessWidget {
  const ScreenOnboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: PageView(
            controller: Provider.of<PageNotifier>(context).controller,
            onPageChanged: (index) {
              Provider.of<PageNotifier>(context, listen: false).isLastPage =
                  index == 3;
            },
            children: const [
              BuildPage(
                title: 'Follow your plan and\n         dreams',
                description:
                    'Build your financial life.Make the right financial\n decisions.See only what is important for you.',
                color: Colors.white,
                image: 'asset/undraw_Savings_re_eq4w-removebg-preview.png',
                // image: 'assets/images/onboarding_1.png',
              ),
              BuildPage(
                title: 'Track Your Spending',
                description:
                    'Track and analyse spending immediately\n and automatically through the app.',

                color: Colors.white,
                image:
                    'asset/undraw_Credit_card_payments_re_qboh-removebg-preview.png',
                // image: 'assets/images/onboarding_1.png',
              ),
              BuildPage(
                title: 'Budget your money',
                description:
                    'Build healthy budgets and track your\n expenses in one place.',

                color: Colors.white,
                image:
                    'asset/undraw_Financial_data_re_p0fl-removebg-preview.png',
                // image: 'assets/images/onboarding_1.png',
              ),
              LastPage()
            ],
          ),
        ),
        bottomSheet: Consumer<PageNotifier>(builder: (context, page, _) {
          return page.isLastPage
              ? const LastpageButton()
              : const OnboardButtons();
        }));
  }
}
