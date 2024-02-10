import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';

class cardMain extends StatelessWidget {
  const cardMain({super.key, required this.name, required this.number});
  final String name;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        height: 100,
        width: 150,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$name :',
                style: TextStyle(color: Colors.white, fontSize: 20),
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
    );
  }
}
