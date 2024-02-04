import 'package:flutter/material.dart';

class CustomInputBox extends StatefulWidget {
  const CustomInputBox({super.key});

  @override
  State<CustomInputBox> createState() => _CustomInputBoxState();
}

class _CustomInputBoxState extends State<CustomInputBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: TextField(
        // decoration: InputDecoration(
        //   border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(15),
        //   ),
        //   labelText: 'Custom Input Box',
        //   prefixIcon: Icon(Icons.person),
        // ),
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
