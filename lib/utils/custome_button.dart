import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  const customButton(
      {super.key, required this.title, required this.buttonColor});
  final String title;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),

        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(5)),
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        // style: ElevatedButton.styleFrom(
        //   backgroundColor: Colors.green, // Set the background color to green
        // ),
      ),
    );
  }
}
