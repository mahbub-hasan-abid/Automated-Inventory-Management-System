import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  const customButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      color: Colors.green,
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
