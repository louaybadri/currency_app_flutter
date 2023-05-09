import 'package:currency_conversion/widgets/conversion_details.dart';

import '../config/size_config.dart';
import '../providers/saved_data_provider.dart';
import '../screens/template/screen_template.dart';
import '../widgets/navbar.dart';
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

class ConversionOperation extends StatelessWidget {
  const ConversionOperation({
    super.key,
    required this.archiveUnit,
  });

  final String archiveUnit;

  @override
  Widget build(BuildContext context) {
    List<String> allData = archiveUnit.split(" ");
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 1),borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.fromLTRB(0,8,0,8),
      child: InkWell(
        onTap: (){
          showDialog(context: context, builder: (_){
            return Dialog(
              elevation: 0,
              child: ConversionDetails(archiveUnit:archiveUnit )
              ,
            );
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              const Text("Conversion From"),
              SizedBox(
                width: SizeConfig.screenWidth*0.4,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(allData[4]),
                      Text(allData[2]),
                    ],
                  ),
                ),
              ),
            ]),Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              const Text("To"),
              SizedBox(
                width: SizeConfig.screenWidth*0.4,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(allData[5]),
                      Text(allData[3]),
                    ],
                  ),
                ),
              ),
            ]),

          ],
        ),
      ),
    );
  }
}
