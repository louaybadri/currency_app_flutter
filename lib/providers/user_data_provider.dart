

import 'package:flutter/material.dart';

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