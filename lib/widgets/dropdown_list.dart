import 'package:currency_conversion/providers/currencies_provider.dart';
import '../providers/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownList extends StatelessWidget {
  const DropDownList({
    super.key,
    required this.currencies,
    required this.from,
  });

  final List<String> currencies;

  //from here is a bool that indicates whether we are in the "from" currency or we are in the "to" currency
  // true means "form"
  // false means "to"
  final bool from;

@override
Widget build(BuildContext context) {
  return currencies.isEmpty
      ? const CircularProgressIndicator()
      : Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black)),
          padding: const EdgeInsets.all(12),
          child: Center(
            child: DropdownButton<String>(
              value: from
                  ? context.watch<UserData>().from == ""
                      ? currencies.first
                      : context.watch<UserData>().from
                  : context.watch<UserData>().to == ""
                      ? currencies.first
                      : context.watch<UserData>().to,
              icon: const Icon(Icons.arrow_downward),
              // elevation: 16,
              style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              underline: Container(
                // height: 2,
                color: Colors.transparent,
              ),
              onChanged: (String? value) {
                from
                    ? context.read<UserData>().setFrom(value!)
                    : context.read<UserData>().setTo(value!);
                String _from = context.read<UserData>().from;
                String _to = context.read<UserData>().to;
                context.read<Currencies>().updateRatio(_from, _to);
              },
              items: currencies.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ));
}

}
