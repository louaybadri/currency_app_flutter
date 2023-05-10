import '../config/size_config.dart';
import '../providers/currencies_provider.dart';
import '../providers/user_data_provider.dart';
import '../screens/main_screen.dart';
import '../screens/template/screen_template.dart';
import '../widgets/shared_widgets/rounded_border_container.dart';
import '../widgets/shared_widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/shared_widgets/dropdown_list.dart';
import '../widgets/initial_screen_widgets/invalid_username_alert.dart';

class InitialScreen extends StatelessWidget {
  InitialScreen({Key? key}) : super(key: key);

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig s = SizeConfig();
    s.init(context);
    return ScreenTemplate(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("lib/assets/currency.png",
              width: SizeConfig.screenWidth * 0.4),
          TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter the Username here please',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropDownList(
                  currencies: context.watch<Currencies>().currencies,
                  from: true),
              Image.asset(
                "lib/assets/convert.png",
                width: SizeConfig.screenWidth * 0.12,
              ),
              DropDownList(
                  currencies: context.watch<Currencies>().currencies,
                  from: false),
            ],
          ),
          RoundedBorderContainer(
            widthRatio: 0.5,
            backgroundColor: const Color.fromARGB(255, 70, 106, 148),
            child: TextButton(
              child: const StyledText(text:"Submit"),
              onPressed: () {
                if (textEditingController.text == '') {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return const InvalidUsernameAlert();
                      });
                }else{
                  String from = Provider.of<UserData>(context, listen: false).from;
                  String to = Provider.of<UserData>(context, listen: false).to;
                  context.read<UserData>().setName(textEditingController.text);
                  context.read<Currencies>().updateRatio(from, to);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MainScreen()));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
