
import 'package:flutter/material.dart';

class InvalidUsernameAlert extends StatelessWidget {
  const InvalidUsernameAlert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(Icons.warning),
          Text("You didn't enter a username",textAlign: TextAlign.center,),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Try again'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
