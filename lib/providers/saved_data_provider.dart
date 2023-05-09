

import '../utils/add_data.dart';
import '../utils/clear_data.dart';
import '../utils/get_data.dart';
import 'package:flutter/material.dart';

class SavedData with ChangeNotifier{
  List<String> _savedData = [];

  List<String> get savedData =>_savedData;

  SavedData(){
    loadSavedData();
  }

  void loadSavedData()async{
    _savedData = await getData();
    notifyListeners();
  }

  void addToSavedData(String str)async {
    await addData(str);
    loadSavedData();
  }

  void deleteFromSavedData(String str)async {
    await deleteData(str);
    loadSavedData();
  }
  void deleteAllFromSavedData()async {
    await clearAllData();
    loadSavedData();
  }


}