
import 'package:shared_preferences/shared_preferences.dart';
import '../../consts/constants.dart' as CONSTS;

Future<Map<String, dynamic>> loadUser() async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? username = prefs.getString(CONSTS.username);
  String? fromCurrency = prefs.getString(CONSTS.fromCurrency);
  String? toCurrency = prefs.getString(CONSTS.toCurrency);
  if (username != null && fromCurrency != null && toCurrency != null) {
    return {
      "loaded": true,
      "data": {
        CONSTS.username: username,
        CONSTS.fromCurrency: fromCurrency,
        CONSTS.toCurrency: toCurrency
      }
    };
  } else {
    return {"loaded": false};
  }
}


Future<Map<String, dynamic>> loadFromTo() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? fromCurrency = prefs.getString(CONSTS.fromCurrency);
  String? toCurrency = prefs.getString(CONSTS.toCurrency);
  if ( fromCurrency != null && toCurrency != null) {
    return {
      "loaded": true,
      "data": {
        CONSTS.fromCurrency: fromCurrency,
        CONSTS.toCurrency: toCurrency
      }
    };
  } else {
    return {"loaded": false};
  }
}
