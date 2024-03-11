import 'package:flutter/material.dart';

class CustomContaineBox extends StatelessWidget {
  CustomContaineBox({
    super.key,
    required this.text,
    required this.imageUrl,
    required this.page,
    required this.startingColor,
    required this.endColor,
  });

  final Widget page;
  final String text;
  final String imageUrl;
  final Color startingColor;
  final Color endColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ));
      },
      child: Card(
        elevation: 5,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.amber,
              gradient: LinearGradient(
                  colors: [startingColor, endColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: const GradientRotation(180)),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.shade900,
                  offset: const Offset(0, 3),
                  blurRadius: 6,
                  spreadRadius: 0,
                ),
              ],
            ),
            height: 80,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(imageUrl),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      text,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
