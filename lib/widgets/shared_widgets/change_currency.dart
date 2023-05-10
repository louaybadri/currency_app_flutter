
import '../../widgets/shared_widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/currencies_provider.dart';
import 'dropdown_list.dart';
import '../../consts/constants.dart' as CONSTS;

class ChangeCurrency extends StatelessWidget {
  const ChangeCurrency({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const StyledText(text: "From",color: CONSTS.blue),
            DropDownList(
                currencies: context
                    .read<Currencies>()
                    .currencies,
                from: true),
          ],
        ),
        Column(
          children: [
            const StyledText(text: "To",color: CONSTS.blue),
            DropDownList(
                currencies: context
                    .read<Currencies>()
                    .currencies,
                from: false),
          ],
        ),
      ],
    );
  }
}
