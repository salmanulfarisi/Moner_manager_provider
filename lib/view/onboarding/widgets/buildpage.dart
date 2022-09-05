import 'package:flutter/material.dart';
import 'package:money_manager/utilities/textstyles.dart';

class BuildPage extends StatelessWidget {
  final Color color;
  final String image;
  final String title;
  final String description;
  const BuildPage(
      {Key? key,
      required this.color,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          const SizedBox(
            height: 64,
          ),
          Text(
            title,
            style: onboardTextStyle,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              description,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
        ],
      ),
    );
  }
}
