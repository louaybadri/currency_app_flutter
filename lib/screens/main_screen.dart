import 'package:currency_conversion/providers/currencies.dart';
import 'package:currency_conversion/providers/user_data_provider.dart';
import 'package:currency_conversion/screens/template/screen_template.dart';
import 'package:currency_conversion/utils/convert_from_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../config/size_config.dart';
import '../widgets/rounded_border_container.dart';
import '../widgets/styled_text.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController textEditingController = TextEditingController();

  double value = 0;

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      child: Container(
        // decoration: const BoxDecoration(color: Colors.red),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.abc,
                  size: 50,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.abc,
                      size: 50,
                    ),
                    Icon(
                      Icons.abc,
                      size: 50,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedBorderContainer(
                  widthRatio: 0.3,
                  backgroundColor: const Color.fromARGB(255, 70, 106, 148),
                  child: StyledText(text: context.watch<UserData>().from),
                ),
                InkWell(
                  onTap: () {
                    context.read<UserData>().switchCurrencies();
                    String from =
                        Provider.of<UserData>(context, listen: false).from;
                    String to =
                        Provider.of<UserData>(context, listen: false).to;
                    context.read<Currencies>().updateRatio(from, to);
                  },
                  child: Image.asset(
                    "lib/assets/convert.png",
                    width: SizeConfig.screenWidth * 0.12,
                  ),
                ),
                RoundedBorderContainer(
                  widthRatio: 0.3,
                  backgroundColor: const Color.fromARGB(255, 70, 106, 148),
                  child: StyledText(text: context.watch<UserData>().to),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight * .25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextField(
                    onChanged: (str) {
                      if (str.isEmpty) {
                        setState(() {
                          value = 0;
                        });
                      } else {
                        setState(() {
                          value = double.parse(str);
                        });
                      }
                    },
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Currency to convert',
                    ),
                  ),
                  RoundedBorderContainer(
                    widthRatio: 0.8,
                    backgroundColor: const Color.fromARGB(255, 70, 106, 148),
                    child: StyledText(
                        text: (value * context.watch<Currencies>().ratio)
                            .toStringAsFixed(3)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * .25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      String date = DateTime.now().toString();
                      String fromCurrency = Provider.of<UserData>(context,listen: false).from;
                      String toCurrency = Provider.of<UserData>(context,listen: false).to;
                      String fromValue = textEditingController.text;
                      String toValue = (value*Provider.of<Currencies>(context,listen: false).ratio)
                          .toStringAsFixed(3);
                      String allData ="$date $fromCurrency $toCurrency $fromValue $toValue";

                      print(allData.split(" "));
                      },
                    child: RoundedBorderContainer(
                      widthRatio: 0.8,
                      backgroundColor: const Color.fromARGB(255, 55, 126, 63),
                      child: Image.asset(
                        "lib/assets/save.png",
                        width: SizeConfig.screenWidth * 0.10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  RoundedBorderContainer(
                    widthRatio: 0.8,
                    backgroundColor: const Color.fromARGB(255, 235, 57, 44),
                    child: Image.asset(
                      "lib/assets/delete.png",
                      width: SizeConfig.screenWidth * 0.10,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
