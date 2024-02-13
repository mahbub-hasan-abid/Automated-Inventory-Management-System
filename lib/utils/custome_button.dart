import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  const customButton(
      {super.key, required this.title, required this.buttonColor});
  final String title;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      color: buttonColor,
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      // style: ElevatedButton.styleFrom(
      //   backgroundColor: Colors.green, // Set the background color to green
      // ),
    );
  }
}
