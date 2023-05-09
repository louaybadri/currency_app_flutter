
import 'package:currency_conversion/widgets/shared_widgets/rounded_border_container.dart';
import 'package:flutter/material.dart';

import '../../config/size_config.dart';

class DiscardButton extends StatelessWidget {
  const DiscardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
    );
  }
}
