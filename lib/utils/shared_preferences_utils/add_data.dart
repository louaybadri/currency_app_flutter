// this function saves a string containing the data / time / currencies / amounts in a list of string in shared pref called "items"

import 'package:shared_preferences/shared_preferences.dart';

Future<void> addData(String str) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? items = prefs.getStringList("items");
  if (items != null) {
    items.add(str);
    prefs.setStringList('items', items);
  } else {
    prefs.setStringList('items', <String>[str]);
  }
}


