import 'package:currency_conversion/providers/currencies.dart';
import 'package:currency_conversion/providers/user_data_provider.dart';
import 'package:currency_conversion/screens/template/screen_template.dart';
import 'package:currency_conversion/utils/convert_from_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../config/size_config.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController  textEditingController = TextEditingController();

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
                  textValue: context.watch<UserData>().from,
                ),
                InkWell(
                  onTap: (){
                    context.read<UserData>().switchCurrencies();
                    String from = Provider.of<UserData>(context,listen: false).from;
                    String to = Provider.of<UserData>(context,listen: false).to;
                    context.read<Currencies>().updateRatio(from, to);
                  },
                  child: Image.asset(
                    "lib/assets/convert.png",
                    width: SizeConfig.screenWidth * 0.12,
                  ),
                ),
                RoundedBorderContainer(
                  widthRatio: 0.3,
                  textValue: context.watch<UserData>().to,
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight * .25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                TextField(
                  onChanged: (str){
                    if(str.isEmpty){
                      setState(() {
                        value = 0;
                      });
                    }else {
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

                  ),),
                  RoundedBorderContainer(widthRatio: 0.8,textValue: (value*context.watch<Currencies>().ratio).toStringAsFixed(3)),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * .25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  RoundedBorderContainer(widthRatio: 0.8,textValue: "hi5"),
                  RoundedBorderContainer(widthRatio: 0.8,textValue: "hi6")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RoundedBorderContainer extends StatelessWidget {
  const RoundedBorderContainer({
    super.key, required this.widthRatio, required this.textValue,
  });
  final double widthRatio;
  final String textValue;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(22),
        width: SizeConfig.screenWidth * widthRatio,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15)),
        child: Center(child: Text(textValue)));
  }
}
