import 'package:currency_conversion/widgets/shared_widgets/rounded_border_container.dart';
import 'package:currency_conversion/widgets/shared_widgets/styled_text.dart';

import 'show_amount_and_currency.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/size_config.dart';
import '../../providers/saved_data_provider.dart';
import 'label_and_date_or_time.dart';
class ConversionDetails extends StatelessWidget {
  const ConversionDetails({
    super.key,
    required this.archiveUnit,
  });

  final String archiveUnit;

  @override
  Widget build(BuildContext context) {
    List<String> allData = archiveUnit.split(" ");
    return Container(
      height: SizeConfig.screenHeight * .3,

      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(15),color: Colors.white),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.currency_exchange,
                size: SizeConfig.screenWidth * .2,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        LabelAndDateOrTime(value: allData[0],label: "Date"),
                        LabelAndDateOrTime(value:
                        allData[1].substring(0, 8),label: "Time"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: SizeConfig.screenWidth * .2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ShowAmountAndCurrency(currency: allData[4],amount: allData[2], title: "From",),
                          ShowAmountAndCurrency(currency: allData[5],amount: allData[3], title: "To",),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),

          RoundedBorderContainer(backgroundColor: Colors.red,
            widthRatio: 0.3,
            padding: 5,
            child: InkWell(
                onTap: () {
                  context.read<SavedData>().deleteFromSavedData(archiveUnit);
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.delete,color: Colors.white,size: 30,),

                    StyledText(text:"Delete"),
                    ],
                )),
          )
        ],
      ),
    );
  }
}
