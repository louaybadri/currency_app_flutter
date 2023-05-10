import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<String>> getAllCurrencies() async {
  try {
    String url =
        "https://api.fastforex.io/currencies?api_key=63d0cbad05-cca154bf7e-rucdzf";
    http.Response res = await http.get(Uri.parse(url));

    List<String> data = jsonDecode(res.body)["currencies"].keys.toList();
    return data;
  } catch (e) {
    debugPrint(e.toString());
    rethrow;
  }
}
