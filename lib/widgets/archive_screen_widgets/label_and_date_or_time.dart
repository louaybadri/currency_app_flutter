
import 'package:flutter/cupertino.dart';

class LabelAndDateOrTime extends StatelessWidget {
  const LabelAndDateOrTime({
    super.key, required this.label, required this.value,
  });
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          Text(value),
        ]);
  }
}
