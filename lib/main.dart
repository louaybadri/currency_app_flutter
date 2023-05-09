import 'package:currency_conversion/screens/splash_screen.dart';

import '../providers/currencies_provider.dart';
import '../providers/saved_data_provider.dart';
import '../providers/user_data_provider.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Currency Convert',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
