import 'package:flutter/material.dart';

class PageNotifier extends ChangeNotifier {
  bool _isLastPage = false;
  final controller = PageController(initialPage: 0);
  final nameConroller = TextEditingController();

  bool get isLastPage => _isLastPage;
  set isLastPage(bool value) {
    _isLastPage = value;
    notifyListeners();
  }
}
