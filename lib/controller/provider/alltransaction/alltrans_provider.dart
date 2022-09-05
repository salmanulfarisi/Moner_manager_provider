import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:month_year_picker/month_year_picker.dart';

class AllTransProvider extends ChangeNotifier {
  String dropDownVlaue = 'All';
  final _items = <String>['All', 'Income', 'Expense'];
  final dateFilter = <String>[
    'All',
    'Today',
    'Yesterday',
    'Last 7 Days',
    'Last 30 Days',
  ];
  String _selectedItem = 'All';
  // get items => _items;
  List<String> get items => _items;
  String get selectedItem => _selectedItem;
  set setSelectedItem(String selectedItem) {
    _selectedItem = selectedItem;
    notifyListeners();
  }

  get getDateFilter => dateFilter;
  set setDateFilter(String selectedItem) {
    _selectedItem = selectedItem;
    notifyListeners();
  }

  get getDropDownVlaue => dropDownVlaue;
  set setDropDownVlaue(String selectedItem) {
    _selectedItem = selectedItem;
    notifyListeners();
  }

  Future<void> selectMonth(
      {required BuildContext context, String? locale}) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showMonthYearPicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now(),
        locale: localeObj);
    if (selected != null) {
      print('Selected date: ${selected.toIso8601String()}');
    }
  }
}
