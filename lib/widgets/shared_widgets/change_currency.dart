
import 'package:currency_conversion/widgets/shared_widgets/rounded_border_container.dart';
import 'package:currency_conversion/widgets/shared_widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/currencies_provider.dart';
import 'dropdown_list.dart';

class ChangeCurrency extends StatelessWidget {
  const ChangeCurrency({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedBorderContainer(
      backgroundColor: Colors.white,
      widthRatio: 0.9,
      padding: 12,
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const StyledText(text: "From",color: Color.fromARGB(255, 70, 106, 148)),
              DropDownList(
                  currencies: context
                      .read<Currencies>()
                      .currencies,
                  from: true),
            ],
          ),
          Column(
            children: [
              const StyledText(text: "To",color: Color.fromARGB(255, 70, 106, 148)),
              DropDownList(
                  currencies: context
                      .read<Currencies>()
                      .currencies,
                  from: false),
            ],
          ),
        ],
      ),
    );
  }
}
