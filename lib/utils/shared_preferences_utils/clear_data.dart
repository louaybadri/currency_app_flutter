import 'package:shared_preferences/shared_preferences.dart';

Future<void> clearAllData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("items");
}

Future<void> deleteData(str) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? items =  prefs.getStringList("items");
  if(items != null){
    if (items.remove(str)){
      prefs.setStringList('items',items );
    }
  }else{
    prefs.setStringList('items',[]);
  }
}