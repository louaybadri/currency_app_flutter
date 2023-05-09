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
                  .map((e) => ArchiveUnit(
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

class ArchiveUnit extends StatelessWidget {
  const ArchiveUnit({
    super.key,
    required this.archiveUnit,
  });

  final String archiveUnit;

  @override
  Widget build(BuildContext context) {
    List<String> allData = archiveUnit.split(" ");
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 1),borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.fromLTRB(0,8.0,0,8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
            const Text("Date"),
            Text(allData[0]),
          ]),
          Column(children: [
            const Text("Time"),
            Text(allData[1].substring(0,8)),
          ]),
          Column(children: [
            const Text("From"),
            Row(

              children: [
                Text(allData[4]),
                Text(allData[2]),
              ],
            ),
          ]),Column(children: [
            const Text("To"),
            Row(

              children: [
                Text(allData[5]),
                Text(allData[3]),
              ],
            ),
          ]),
          InkWell(
              onTap: (){
                context.read<SavedData>().deleteFromSavedData(archiveUnit);

              },
              child: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
