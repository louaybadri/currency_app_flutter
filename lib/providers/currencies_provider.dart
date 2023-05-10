import 'package:currency_conversion/utils/convert_from_to.dart';
import 'package:currency_conversion/utils/get_all_currencies.dart';
import 'package:flutter/material.dart';

class Currencies with ChangeNotifier {
  List<String> _currencies = [];
  double _ratio=1.0;
  List<String> get currencies => _currencies;
  double get ratio => _ratio;

  Currencies() {
    initData();
  }

  Future<void> initData() async {
    _currencies = await getAllCurrencies();
    notifyListeners();
  }

  Future<void> updateRatio(String from,String to)async{
    _ratio =  await convertFromTo(from, to);
    notifyListeners();
  }
}
