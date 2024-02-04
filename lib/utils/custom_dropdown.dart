import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown(
      {super.key,
      required this.title,
      required this.options,
      required this.controller});
  final String title;
  final List<String> options;
  final TextEditingController controller;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  late String selectedValue =
      widget.options.first; // Initialize with first option

  @override
  void initState() {
    super.initState();
    widget.controller.text = selectedValue; // Set initial value in controller
  }

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
              flex: 8,
              child: Text(
                ' ${widget.title} :',
                style: const TextStyle(fontSize: 15),
              )),
          Expanded(
            flex: 17,
            child: DropdownButton<String>(
              value: selectedValue,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(fontSize: 15),
              underline: Container(
                height: 1,
                color: Colors.grey,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                  widget.controller.text = newValue; // Update controller text
                });
              },
              items:
                  widget.options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
