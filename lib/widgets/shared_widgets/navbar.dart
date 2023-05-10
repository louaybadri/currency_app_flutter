import 'package:currency_conversion/widgets/shared_widgets/styled_text.dart';

import '../../config/size_config.dart';
import '../../providers/currencies_provider.dart';
import '../../providers/user_data_provider.dart';
import 'change_currency.dart';
import 'change_username.dart';
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

                  Provider.of<UserData>(context,listen: false).resetTemp();
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
                            child: RoundedBorderContainer(
                              backgroundColor: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ChangeUserName(
                                      textEditingController:
                                          textEditingController),
                                  const ChangeCurrency(),
                                  TextButton(
                                    onPressed: () {
                                      if (textEditingController.text != '') {
                                        context.read<UserData>().setName(
                                            textEditingController.text);
                                        context.read<UserData>().submitFrom();
                                        context.read<UserData>().submitTo();

                                        String fromCurrency =
                                            Provider.of<UserData>(context,
                                                    listen: false)
                                                .from;
                                        String toCurrency =
                                            Provider.of<UserData>(context,
                                                    listen: false)
                                                .to;
                                        context
                                            .read<Currencies>()
                                            .updateRatio(
                                                fromCurrency, toCurrency);
                                        context
                                            .read<UserData>()
                                            .logOrRefreshTheUser();
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const RoundedBorderContainer(
                                      backgroundColor: Color.fromARGB(255, 70, 106, 148),
                                      child: StyledText(
                                        text:"Submit",
                                      ),
                                    ),
                                  )
                                ],
                              ),
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
