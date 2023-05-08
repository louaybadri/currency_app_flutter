import 'package:flutter/material.dart';

import '../config/size_config.dart';

class DropDownList extends StatelessWidget {
  const DropDownList({
    super.key, required this.currencies,
  });
  final List<String> currencies;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.black)),
      padding: const EdgeInsets.all(12),
      // width: SizeConfig.screenWidth * 0.2,
      // height: SizeConfig.screenHeight*.2,
      child: currencies.isEmpty?Text("Loading"):DropdownButton<String>(
      value: currencies.first,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(
        color: Colors.deepPurple, fontWeight: FontWeight.bold,fontSize: 20,),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
      },
      items: currencies.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
    );
  }
}
