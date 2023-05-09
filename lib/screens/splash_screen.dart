import 'dart:async';
import 'package:currency_conversion/screens/initial_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                InitialScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:
        Image.asset("lib/assets/exchange0.png"),
    );
  }
}
