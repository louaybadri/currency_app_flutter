

import 'package:currency_conversion/providers/currencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserData with ChangeNotifier{
  String _username = "";
  String _from = "AED";
  String _to = "AED";

  String get username =>_username;
  String get from => _from;
  String get to => _to;

  void setName(String newName) {
    _username = newName;
    notifyListeners();
  }

  void setFrom(String from) {
    _from = from;
    notifyListeners();
  }

  void setTo(String to) {
    _to = to;
    notifyListeners();
  }


  void switchCurrencies(){
    String aux = _from;
    _from = _to;
    _to = aux;
    notifyListeners();
  }

}