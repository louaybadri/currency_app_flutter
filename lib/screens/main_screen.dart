import '../providers/currencies_provider.dart';
import '../providers/saved_data_provider.dart';
import '../providers/user_data_provider.dart';
import '../screens/template/screen_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../config/size_config.dart';
import '../widgets/navbar.dart';
import '../widgets/rounded_border_container.dart';
import '../widgets/styled_text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController textEditingController = TextEditingController();

  double value = 0;
  bool invalidAmount = false;

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const NavBar(isArchiveScreenActive: false),
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
                  String to = Provider.of<UserData>(context, listen: false).to;
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
                        try {
                          value = double.parse(str);
                          invalidAmount = false;
                        } catch (e) {
                          invalidAmount = true;
                        }
                      });
                    }
                  },
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Currency to convert',
                  ),
                ),
                RoundedBorderContainer(
                  widthRatio: 0.8,
                  backgroundColor: const Color.fromARGB(255, 70, 106, 148),
                  child: StyledText(
                      text: invalidAmount
                          ? "Invalid Amount"
                          : (value * context.watch<Currencies>().ratio)
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
                  onTap: () async {
                    if(textEditingController.text==''){
                      showDialog(context: context, builder: (_){
                        return AlertDialog(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(Icons.warning),
                              Text("You didn't enter any amount, try again"),
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
                    }else {
                      String date = DateTime.now().toString();
                      String fromCurrency =
                          Provider.of<UserData>(context, listen: false).from;
                      String toCurrency =
                          Provider.of<UserData>(context, listen: false).to;
                      String fromValue = value.toString();
                      String toValue = (value *
                              Provider.of<Currencies>(context, listen: false)
                                  .ratio)
                          .toStringAsFixed(3);
                      String allData =
                          "$date $fromCurrency $toCurrency $fromValue $toValue";
                      context.read<SavedData>().addToSavedData(allData);
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Icon(Icons.done),
                                  Text("Data Saved"),
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
                    }
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
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: RoundedBorderContainer(
                    widthRatio: 0.8,
                    backgroundColor: const Color.fromARGB(255, 235, 57, 44),
                    child: Image.asset(
                      "lib/assets/delete.png",
                      width: SizeConfig.screenWidth * 0.10,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
