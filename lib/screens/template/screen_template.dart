import 'package:currency_conversion/config/size_config.dart';
import 'package:flutter/material.dart';

class ScreenTemplate extends StatelessWidget {
  const ScreenTemplate({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    SizeConfig s = SizeConfig();
    final TextEditingController textEditingController = TextEditingController();
    s.init(context);
    return Scaffold(resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
            padding: EdgeInsets.fromLTRB(0, SizeConfig.topPadding, 0, 0),
            width: SizeConfig.screenWidth * 0.9,
            height: SizeConfig.screenHeight,
            child: child),
      ),
    );
  }
}
