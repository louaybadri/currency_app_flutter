import 'package:shared_preferences/shared_preferences.dart';
import '../../consts/constants.dart' as CONSTS;

Future<void> logUserIn(
    String username, String fromCurrency, String toCurrency) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(CONSTS.username, username);
  prefs.setString(CONSTS.fromCurrency, fromCurrency);
  prefs.setString(CONSTS.toCurrency, toCurrency);
}

Future<void> logUserOut() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(CONSTS.username);
  prefs.remove(CONSTS.fromCurrency);
  prefs.remove(CONSTS.toCurrency);
}