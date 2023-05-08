import 'package:currency_conversion/config/size_config.dart';
import 'package:currency_conversion/providers/currencies.dart';
import 'package:currency_conversion/utils/get_all_currencies.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import '../utils/convert_from_to.dart';
import '../widgets/dropdown_list.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig s = SizeConfig();
    s.init(context);
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, SizeConfig.topPadding, 0, 0),
          width: SizeConfig.screenWidth * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("lib/assets/currency.jpg",
                  width: SizeConfig.screenWidth * 0.4),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the Username here please',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropDownList( currencies: context.watch<Currencies>().currencies),
                  // FutureBuilder<List<String>>(
                  //   future: getAllCurrencies(),
                  //   builder: (context,snapshot){
                  //     if(snapshot.hasData){
                  //       List<String> currencies =  snapshot.data as List<String>;
                  //       return(
                  //           DropDownList( currencies: currencies)
                  //       );
                  //     }
                  //     return const Text("Loading");
                  //   },
                  // ),
                  InkWell(
                      // onTap: getAllCurrencies,
                      onTap: () async {
                        await convertFromTo("USD", 'EUR');
                      },
                      child: Image.asset(
                        "lib/assets/convert.png",
                        width: SizeConfig.screenWidth * 0.12,
                      )),
                  DropDownList( currencies: context.watch<Currencies>().currencies),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
