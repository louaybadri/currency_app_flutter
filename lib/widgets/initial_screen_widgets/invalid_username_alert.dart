
import 'package:flutter/material.dart';

class InvalidUsernameAlert extends StatelessWidget {
  const InvalidUsernameAlert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(Icons.warning),
          Text("You didn't enter a Username, try again"),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Back to Page'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
