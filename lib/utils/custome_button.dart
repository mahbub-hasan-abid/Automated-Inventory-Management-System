import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  const customButton(
      {super.key,
      required this.title,
      required this.startingColor,
      required this.endColor});
  final String title;
  final Color startingColor, endColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),

        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [startingColor, endColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                transform: GradientRotation(180)),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.shade900,
                offset: Offset(0, 3),
                blurRadius: 6,
                spreadRadius: 0,
              ),
            ],
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ),
        // style: ElevatedButton.styleFrom(
        //   backgroundColor: Colors.green, // Set the background color to green
        // ),
      ),
    );
  }
}
