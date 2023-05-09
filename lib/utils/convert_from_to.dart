import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<double> convertFromTo(String from, String to) async {
  try {
    if(from == to){
      return 1;
    }
    String url =
        "https://api.fastforex.io/fetch-one?from=$from&to=$to&api_key=63d0cbad05-cca154bf7e-rucdzf";

    http.Response res = await http.get(Uri.parse(url));
    final double data = jsonDecode(res.body)["result"][to];
    return data;
  } catch (e) {
    debugPrint(e.toString());
    rethrow;
  }
}