import 'package:flutter/material.dart';

class CustomInputBox extends StatelessWidget {
  const CustomInputBox(
      {super.key, required this.controller, required this.title});
  final String title;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width * .40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 4,
              child: Text(
                title,
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
