import 'package:flutter/material.dart';

class CustomInputBox extends StatelessWidget {
  const CustomInputBox(
      {super.key, required this.controller, required this.title});
  final String title;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 40,
        width: MediaQuery.of(context).size.width * .40,
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
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 223, 220, 213),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
