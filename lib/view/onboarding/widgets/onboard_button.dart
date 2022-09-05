import 'package:flutter/material.dart';
import 'package:money_manager/controller/provider/pageview/pageview_provider.dart';
import 'package:money_manager/utilities/colors.dart';
import 'package:money_manager/utilities/textstyles.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardButtons extends StatelessWidget {
  const OnboardButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () => Provider.of<PageNotifier>(context, listen: false)
                  .controller
                  .jumpToPage(3),
              child: const Text(
                'Skip',
                style: onboardButtonTextStyle,
              )),
          Center(
            child: SmoothPageIndicator(
              controller:
                  Provider.of<PageNotifier>(context, listen: false).controller,
              count: 4,
              effect: const WormEffect(
                  dotColor: Colors.black26, activeDotColor: greenColor),
            ),
          ),
          TextButton(
              onPressed: () => Provider.of<PageNotifier>(context, listen: false)
                  .controller
                  .nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut),
              child: const Text('Next', style: onboardButtonTextStyle)),
        ],
      ),
    );
  }
}
