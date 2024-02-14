import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';

class cardMain extends StatelessWidget {
  const cardMain({super.key, required this.name, required this.number});
  final String name;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color.fromARGB(255, 0, 0, 0),
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 25, 255, 5),
                    const Color.fromARGB(255, 20, 45, 114)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: GradientRotation(90)),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.shade900,
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  spreadRadius: 0,
                ),
              ]),
          height: 100,
          width: 150,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$name',
                  style: TextStyle(color: Colors.white, fontSize: 21),
                ),
                AnimatedDigitWidget(
                  duration: Duration(seconds: 2),
                  value: number,
                  textStyle: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
