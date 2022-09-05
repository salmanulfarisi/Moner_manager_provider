import 'package:flutter/material.dart';
import 'package:money_manager/controller/provider/pageview/pageview_provider.dart';
import 'package:money_manager/utilities/colors.dart';
import 'package:money_manager/utilities/textstyles.dart';
import 'package:provider/provider.dart';

class LastPage extends StatelessWidget {
  const LastPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  'asset/undraw_Profile_data_re_v81r-removebg-preview.png'),
              const SizedBox(
                height: 64,
              ),
              const Text(
                'What is Your name?',
                style: onboardTextStyle,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: Provider.of<PageNotifier>(context, listen: false)
                    .nameConroller,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  fillColor: whiteColor,
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
