

import 'package:flutter/material.dart';

import '../../config/size_config.dart';

class RoundedBorderContainer extends StatelessWidget {
  const RoundedBorderContainer(
      {super.key,
         this.widthRatio,
        required this.child,
        required this.backgroundColor, this.padding});

  final double? widthRatio;
  final Widget child;
  final Color backgroundColor;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(padding??20),
        width: widthRatio==null ?null :SizeConfig.screenWidth*widthRatio! ,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor),
        child: Center(child: child));
  }
}
