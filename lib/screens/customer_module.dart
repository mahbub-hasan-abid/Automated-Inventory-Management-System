import 'package:flutter/material.dart';
import 'package:inventory_management/utils/custom_appbar.dart';
import 'package:inventory_management/utils/custome_button.dart';
import 'package:inventory_management/utils/input_box.dart';

class CustomerModule extends StatefulWidget {
  const CustomerModule({super.key});

  @override
  State<CustomerModule> createState() => _CustomerModuleState();
}

class _CustomerModuleState extends State<CustomerModule> {
  TextEditingController customerNameText = TextEditingController();
  TextEditingController phoneText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customAppbar(),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 35,
            color: const Color.fromARGB(255, 240, 21, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Customer Module',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomInputBox(
                controller: customerNameText,
                title: 'User Name',
              ),
              CustomInputBox(
                controller: phoneText,
                title: 'Phone Number',
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            customButton(title: 'Save'),
            SizedBox(
              width: 10,
            ),
            customButton(
              title: 'Update',
            ),
            SizedBox(
              width: 10,
            ),
            customButton(
              title: 'Clear',
            )
          ])
        ],
      ),
    );
  }
}
