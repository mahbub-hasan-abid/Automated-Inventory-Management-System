import 'package:flutter/material.dart';

class CustomSearchBox extends StatelessWidget {
  const CustomSearchBox(
      {super.key,
      required this.controller,
      required this.title,
      required this.wd});
  final String title;
  final TextEditingController controller;
  final double wd;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width * wd,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 8,
              child: Text(
                ' $title :',
                style: const TextStyle(fontSize: 15),
              )),
          Expanded(
            flex: 17,
            child: TextField(
              controller: controller,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
