

import 'package:flutter/material.dart';

import '../../config/size_config.dart';

class RoundedBorderContainer extends StatelessWidget {
  const RoundedBorderContainer(
      {super.key,
        required this.widthRatio,
        required this.child,
        required this.backgroundColor});

  final double widthRatio;
  final Widget child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(22),
        width: SizeConfig.screenWidth * widthRatio,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor),
        child: Center(child: child));
  }
}
