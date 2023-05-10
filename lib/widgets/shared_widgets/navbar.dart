import 'package:currency_conversion/widgets/initial_screen_widgets/invalid_username_alert.dart';

import '../../config/size_config.dart';
import '../../providers/currencies_provider.dart';
import '../../providers/user_data_provider.dart';
import 'change_currency.dart';
import 'change_username.dart';
import 'dropdown_list.dart';
import 'rounded_border_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../screens/archive_screen.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.isArchiveScreenActive,
  });

  final bool isArchiveScreenActive;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("lib/assets/currency.png", width: 50),
          Row(
            children: [
              InkWell(
                onTap: () {
                  isArchiveScreenActive
                      ? Navigator.pop(context)
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ArchiveScreen()));
                },
                child: const Icon(
                  Icons.storage,
                  size: 50,
                ),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        TextEditingController textEditingController =
                            TextEditingController(
                                text: context.watch<UserData>().username);
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          child: SizedBox(
                            height: SizeConfig.screenHeight * 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ChangeUserName(textEditingController: textEditingController),
                                const ChangeCurrency(),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: const Icon(
                  Icons.settings,
                  size: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
