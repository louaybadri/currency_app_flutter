
import 'package:currency_conversion/widgets/shared_widgets/rounded_border_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/size_config.dart';
import '../../providers/currencies_provider.dart';
import '../../providers/saved_data_provider.dart';
import '../../providers/user_data_provider.dart';
import 'data_saved_alert.dart';
import '../../consts/constants.dart' as CONSTS;

class SaveDataButton extends StatelessWidget {
  const SaveDataButton({
    super.key,
    required this.textEditingController,
    required this.value,
  });

  final TextEditingController textEditingController;
  final double value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (textEditingController.text == '') {
          ifEmptyString(context);
        } else {
          ifNotEmptyString(context);
        }
      },
      child: RoundedBorderContainer(
        widthRatio: 0.8,
        backgroundColor: CONSTS.green,
        child: Image.asset(
          "lib/assets/save.png",
          width: SizeConfig.screenWidth * 0.10,
          color: Colors.white,
        ),
      ),
    );
  }

  void ifNotEmptyString(BuildContext context) {
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
          return const DataSavedAlert();
        });
  }

  Future<dynamic> ifEmptyString(BuildContext context) {
    return showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.warning),
                    Text(
                        "You didn't enter any amount, try again"),
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
}
