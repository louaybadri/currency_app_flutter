
import 'package:currency_conversion/widgets/shared_widgets/rounded_border_container.dart';
import 'package:flutter/material.dart';

import '../../config/size_config.dart';
import '../../consts/constants.dart' as CONSTS;

class DiscardButton extends StatelessWidget {
  const DiscardButton({
    super.key, required this.discardLogic,
  });
  final Function discardLogic;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        discardLogic();
      },
      child: RoundedBorderContainer(
        widthRatio: 0.8,
        backgroundColor: CONSTS.red ,
        child: Image.asset(
          "lib/assets/delete.png",
          width: SizeConfig.screenWidth * 0.10,
          color: Colors.white,
        ),
      ),
    );
  }
}
