import 'package:currency_conversion/config/size_config.dart';
import 'package:currency_conversion/providers/saved_data_provider.dart';
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
                onTap: (){

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
