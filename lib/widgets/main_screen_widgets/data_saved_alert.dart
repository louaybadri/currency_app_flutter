
import 'package:flutter/material.dart';

class DataSavedAlert extends StatelessWidget {
  const DataSavedAlert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceAround,
        children: const [
          Icon(Icons.done),
          Text("Data Saved"),
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
