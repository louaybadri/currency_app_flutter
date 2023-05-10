import 'package:currency_conversion/utils/api_utils/convert_from_to.dart';
import 'package:currency_conversion/utils/api_utils/get_all_currencies.dart';
import 'package:currency_conversion/utils/shared_preferences_utils/load_data.dart';
import 'package:flutter/material.dart';
import '../consts/constants.dart' as CONSTS;

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
    Map<String,dynamic> data = await loadFromTo();
    if(data["loaded"]){
      String from = data["data"][ CONSTS.fromCurrency];
      String to = data["data"][CONSTS.toCurrency];
      await updateRatio(from,to);
    }
    notifyListeners();
  }

  Future<void> updateRatio(String from,String to)async{
    _ratio =  await convertFromTo(from, to);
    notifyListeners();
  }
}
