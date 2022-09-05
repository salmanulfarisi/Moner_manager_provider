import 'package:flutter/cupertino.dart';

class BottomNavigatorProvider extends ChangeNotifier {
  int _currentIndex = 0;

  get index => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
