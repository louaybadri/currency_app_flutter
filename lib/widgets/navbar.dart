import 'package:currency_conversion/config/size_config.dart';
import 'package:currency_conversion/providers/currencies_provider.dart';
import 'package:currency_conversion/providers/saved_data_provider.dart';
import 'package:currency_conversion/providers/user_data_provider.dart';
import 'package:currency_conversion/widgets/dropdown_list.dart';
import 'package:currency_conversion/widgets/rounded_border_container.dart';
import 'package:currency_conversion/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/archive_screen.dart';

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
          InkWell(
            onTap: () {
              context.read<SavedData>().deleteAllFromSavedData();
            },
            child: const Icon(
              Icons.abc,
              size: 50,
            ),
          ),
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
                        TextEditingController textEditingController= TextEditingController(text: context.watch<UserData>().username);
                        return Dialog(

                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          child: SizedBox(
                            height: SizeConfig.screenHeight * 0.4,
                            width: SizeConfig.screenWidth * 0.8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                RoundedBorderContainer(
                                    widthRatio: 0.9,
                                    backgroundColor: Colors.white,
                                    child:
                                    TextField(
                                      onChanged: (str){
                                        context.read<UserData>().setName(str);
                                      },
                                      controller: textEditingController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter the Username here please',
                                      ),
                                    ),
                                ),
                                RoundedBorderContainer(
                                  backgroundColor: Colors.white,
                                  widthRatio: 0.9,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      DropDownList(
                                          currencies: context
                                              .read<Currencies>()
                                              .currencies,
                                          from: true),
                                      DropDownList(
                                          currencies: context
                                              .read<Currencies>()
                                              .currencies,
                                          from: false),
                                    ],
                                  ),
                                ),
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
