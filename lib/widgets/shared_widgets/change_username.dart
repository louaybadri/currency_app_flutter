
import 'package:flutter/material.dart';

class ChangeUserName extends StatelessWidget {
  const ChangeUserName({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}
