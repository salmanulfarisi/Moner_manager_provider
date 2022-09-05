import 'package:flutter/material.dart';

const orangeColor = Colors.deepOrange;
const whiteColor = Colors.white;
const blackColor = Colors.black;
const greenColor = Colors.green;
const kGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomLeft,
  colors: [
    // Color(0xff3CADE6),
    // Color(0xff9A7BF6),
    // Color(0xffC273FB),
    // Color(0xffE07FCF),
    Colors.green,
    Colors.grey,
    Colors.green,
    Colors.grey,
    Colors.green,
  ],
  stops: [0.01, 0.4, 0.5, 0.6, 0.8],
);
// 0.01, 0.2, 0.4, 0.5,
const kGradientDark = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomLeft,
  colors: [
    // Color(0xff3CADE6),
    // Color(0xff9A7BF6),
    // Color(0xffC273FB),
    // Color(0xffE07FCF),
    Colors.indigo,
    Colors.grey,
    Colors.indigo,
    Colors.grey,
    Colors.indigo,
  ],
  stops: [0.01, 0.4, 0.5, 0.6, 0.8],
);
