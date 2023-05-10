// this function gets a a list of string containing each the data / time / currencies / amounts  in shared pref called "items"

import 'package:shared_preferences/shared_preferences.dart';

Future<List<String>> getData() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? items =  prefs.getStringList("items");
  if(items != null){
    return items;
  }else{
    return [];
  }
}


