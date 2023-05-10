import '../providers/currencies_provider.dart';
import '../screens/template/screen_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/size_config.dart';
import '../widgets/main_screen_widgets/currencies_and_switch.dart';
import '../widgets/main_screen_widgets/discard_button.dart';
import '../widgets/shared_widgets/navbar.dart';
import '../widgets/shared_widgets/rounded_border_container.dart';
import '../widgets/main_screen_widgets/save_data_button.dart';
import '../widgets/shared_widgets/styled_text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController textEditingController = TextEditingController();

  double value = 0;
  bool invalidAmount = false;

  void currencyLogic(str) {
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
  }
  void discardLogic(){
    setState(() {
      textEditingController.text="";
      value = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const NavBar(isArchiveScreenActive: false),
          const CurrenciesAndSwitch(),

          //text field and converted amount =>
          SizedBox(
            height: SizeConfig.screenHeight * .25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextField(
                  onChanged: currencyLogic,
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
                SaveDataButton(textEditingController: textEditingController, value: value),
                DiscardButton(discardLogic: discardLogic,)
              ],
            ),
          )
        ],
      ),
    );
  }


}

