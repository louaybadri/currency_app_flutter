
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/user_data_provider.dart';
import 'rounded_border_container.dart';

class ChangeUserName extends StatelessWidget {
  const ChangeUserName({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return RoundedBorderContainer(
      widthRatio: 1,
      backgroundColor: Colors.white,
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceEvenly,
        children: [
          RoundedBorderContainer(
            widthRatio: 0.4,
            backgroundColor: Colors.white,
            padding: 12,
            child: TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          RoundedBorderContainer(
              widthRatio: 0.25,
              backgroundColor: const Color.fromARGB(
                  255, 70, 106, 148),
              padding: 0,
              child:  TextButton(
                onPressed: () {
                  if (textEditingController
                      .text !=
                      '') {

                    context
                        .read<UserData>()
                        .setName(
                        textEditingController
                            .text);
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  "Submit Username",
                  style: TextStyle(
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )
          )
        ],
      ),
    );
  }
}
