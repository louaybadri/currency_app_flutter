

import 'package:currency_conversion/utils/shared_preferences_utils/load_data.dart';
import 'package:flutter/material.dart';
import '../consts/constants.dart' as CONSTS;
import '../utils/shared_preferences_utils/log_user.dart';

class UserData with ChangeNotifier{
  String _username = "";
  String _from = "AED";
  String _to = "AED";
  String _tempFrom = "AED";
  String _tempTo = "AED";
  bool _loggedIn=false;

  String get username =>_username;
  String get from => _from;
  String get to => _to;
  String get tempFrom => _tempFrom;
  String get tempTo => _tempTo;
  bool get loggedIn => _loggedIn;

  void logOut(){
    _loggedIn=false;
    logUserOut();
    notifyListeners();
  }
  void _logIn(){
    _loggedIn = true;
    notifyListeners();
  }
  UserData(){
    _loadData();
  }
  void setName(String newName) {
    _username = newName;
    notifyListeners();
  }

  void submitFrom() {
    _from = _tempFrom;
    notifyListeners();
  }

  void submitTo() {
    _to = _tempTo;
    notifyListeners();
  }
  void setTempFrom(String from) {
    _tempFrom = from;
    notifyListeners();
  }

  void setTempTo(String to) {
    _tempTo = to;
    notifyListeners();
  }
  void switchCurrencies(){
    String aux = _from;
    _from = _to;
    _to = aux;
    notifyListeners();
  }

  void logOrRefreshTheUser()async{
    await logUserIn(_username, _from, _to);
    _logIn();
  }
  void resetTemp(){

    _tempTo=_to;
    _tempFrom=_from;
    notifyListeners();
  }
  void _loadData() async{
    Map<String,dynamic> loadedUser = await loadUser();

    if(loadedUser["loaded"]){
      _from = loadedUser["data"][ CONSTS.fromCurrency];
      _to = loadedUser["data"][CONSTS.toCurrency];
      _username = loadedUser["data"][CONSTS.username];
      _loggedIn = true;
      resetTemp();
    }

  }

}