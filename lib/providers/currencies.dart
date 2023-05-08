import 'package:currency_conversion/utils/get_all_currencies.dart';
import 'package:flutter/material.dart';

class Currencies with ChangeNotifier {
  List<String> _currencies = [];

  List<String> get currencies => _currencies;

  Currencies() {
    initData();
  }

  void initData() async {
    _currencies = await getAllCurrencies();
    notifyListeners();
  }
}
