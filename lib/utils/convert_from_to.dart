import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<double> convertFromTo(String from, String to) async {
  try {
    String url =
        "https://api.fastforex.io/fetch-one?from=$from&to=$to&api_key=63d0cbad05-cca154bf7e-rucdzf";

    // print(url);
    http.Response res = await http.get(Uri.parse(url));
    final double data = jsonDecode(res.body)["result"][to];
    // if (jsonDecode(res.body)["result"][to] is double ) {
    //   print("it is ////////////////////");
    // } else  {
    //   print("it is //////////////////// NOT");
    //
    // }
    // print(data);
    return data;
  } catch (e) {
    debugPrint(e.toString());
    rethrow;
  }
}