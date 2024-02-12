import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inventory_management/screens/main_home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(72, 163, 162, 150),
        child: Center(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Card(
                  elevation: 80, child: Image.asset("assets/industry.gif"))),
        ),
      ),
    );
  }
}
