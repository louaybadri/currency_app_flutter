import '../providers/currencies_provider.dart';
import '../providers/saved_data_provider.dart';
import '../providers/user_data_provider.dart';
import '../screens/initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>Currencies(),),
      ChangeNotifierProvider(create: (_)=>UserData(),),
      ChangeNotifierProvider(create: (_)=>SavedData(),)
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InitialScreen(),
    );
  }
}
