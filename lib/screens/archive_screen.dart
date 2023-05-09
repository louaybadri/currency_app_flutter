
import '../config/size_config.dart';
import '../providers/saved_data_provider.dart';
import '../screens/template/screen_template.dart';
import '../widgets/archive_screen_widgets/conversion_operation.dart';
import '../widgets/shared_widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScreenTemplate(
        child: Column(
      children: [
        const NavBar(isArchiveScreenActive: true),
        SizedBox(
          height: SizeConfig.screenHeight * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...context.watch<SavedData>().savedData
                  .map((e) => ConversionOperation(
                        archiveUnit: e,
                      ))
                  .toList(),
            ],
          ),
        )
      ],
    ));
  }
}
