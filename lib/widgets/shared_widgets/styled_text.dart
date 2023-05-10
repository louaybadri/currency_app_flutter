import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText({
    super.key,
    required this.text, this.color
  });

  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color?? Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}