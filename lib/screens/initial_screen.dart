import 'package:currency_conversion/config/size_config.dart';
import 'package:currency_conversion/providers/currencies_provider.dart';
import 'package:currency_conversion/providers/user_data_provider.dart';
import 'package:currency_conversion/screens/main_screen.dart';
import 'package:currency_conversion/screens/template/screen_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/dropdown_list.dart';

class InitialScreen extends StatelessWidget {
  InitialScreen({Key? key}) : super(key: key);

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig s = SizeConfig();
    s.init(context);
    return ScreenTemplate(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("lib/assets/currency.jpg",
              width: SizeConfig.screenWidth * 0.4),
          TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter the Username here please',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropDownList(
                  currencies: context.watch<Currencies>().currencies,
                  from: true),
              InkWell(
                  // onTap: getAllCurrencies,
                  onTap: () {
                    print(Provider.of<UserData>(context, listen: false).from);
                    print(Provider.of<UserData>(context, listen: false).to);
                    print(
                        Provider.of<UserData>(context, listen: false).username);
                  },
                  child: Image.asset(
                    "lib/assets/convert.png",
                    width: SizeConfig.screenWidth * 0.12,
                  )),
              DropDownList(
                  currencies: context.watch<Currencies>().currencies,
                  from: false),
            ],
          ),
          TextButton(
            child: const Text("Submit"),
            onPressed: () {
              if (textEditingController.text == '') {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Icon(Icons.warning),
                            Text("You didn't enter a Username, try again"),
                          ],
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Back to Page'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              }else{
                String from = Provider.of<UserData>(context, listen: false).from;
                String to = Provider.of<UserData>(context, listen: false).to;
                context.read<UserData>().setName(textEditingController.text);
                context.read<Currencies>().updateRatio(from, to);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainScreen()));
              }
            },
          ),
        ],
      ),
    );
  }
}
