
import 'package:flutter/material.dart';

import '../../config/size_config.dart';

class ShowAmountAndCurrency extends StatelessWidget {
  const ShowAmountAndCurrency({
    super.key, required this.currency, required this.amount, required this.title,
  });
  final String currency;
  final String amount;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title),
      SizedBox(
        width: SizeConfig.screenWidth * 0.4,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text(currency),
              Text(amount),
            ],
          ),
        ),
      ),
    ]);
  }
}
