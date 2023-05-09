
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/size_config.dart';
import '../providers/saved_data_provider.dart';

class ConversionDetails extends StatelessWidget {
  const ConversionDetails({
    super.key,
    required this.archiveUnit,
  });

  final String archiveUnit;

  @override
  Widget build(BuildContext context) {
    List<String> allData = archiveUnit.split(" ");
    return Container(
      height: SizeConfig.screenHeight*.2,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 1),borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.fromLTRB(0,8,0,8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.currency_exchange,size: SizeConfig.screenWidth*.2,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(

                  crossAxisAlignment:CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          const Text("Date"),
                          Text(allData[0]),
                        ]),
                    Column(

                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [

                      const Text("Time"),
                      Text(allData[1].substring(0,8),),
                    ]),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: SizeConfig.screenWidth*.2,
                  child: Column(

                    crossAxisAlignment:CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                        const Text("From"),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(

                            children: [
                              Text(allData[4]),
                              Text(allData[2]),
                            ],
                          ),
                        ),
                      ]),Column(

                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                        const Text("To"),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text(allData[5]),
                              Text(allData[3]),
                            ],
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              )
            ],
          ),
          InkWell(
              onTap: (){
                context.read<SavedData>().deleteFromSavedData(archiveUnit);
                Navigator.pop(context);
              },
              child: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
