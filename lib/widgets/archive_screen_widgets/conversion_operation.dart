import 'package:currency_conversion/widgets/archive_screen_widgets/show_amount_and_currency.dart';
import 'package:flutter/material.dart';

import 'conversion_details.dart';

class ConversionOperation extends StatelessWidget {
  const ConversionOperation({
    super.key,
    required this.archiveUnit,
  });

  final String archiveUnit;

  @override
  Widget build(BuildContext context) {
    List<String> allData = archiveUnit.split(" ");
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (_) {
                return Dialog(
                  elevation: 0,
                  child: ConversionDetails(archiveUnit: archiveUnit),
                );
              });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ShowAmountAndCurrency(currency: allData[4],amount: allData[2], title: "Conversion From",),
            ShowAmountAndCurrency(currency: allData[5],amount: allData[3], title: "To",),
            ],
        ),
      ),
    );
  }
}
