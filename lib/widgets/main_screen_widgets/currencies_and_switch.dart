import 'package:currency_conversion/widgets/shared_widgets/rounded_border_container.dart';
import 'package:currency_conversion/widgets/shared_widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/size_config.dart';
import '../../providers/currencies_provider.dart';
import '../../providers/user_data_provider.dart';

class CurrenciesAndSwitch extends StatelessWidget {
  const CurrenciesAndSwitch({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
