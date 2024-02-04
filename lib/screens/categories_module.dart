import 'package:flutter/material.dart';
import 'package:inventory_management/utils/custom_appbar.dart';
import 'package:inventory_management/utils/custome_button.dart';
import 'package:inventory_management/utils/input_box.dart';

class UserModule extends StatefulWidget {
  const UserModule({super.key});

  @override
  State<UserModule> createState() => _UserModuleState();
}

class _UserModuleState extends State<UserModule> {
  TextEditingController categoryNameText = TextEditingController();

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
                  'Category Module',
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
                controller: categoryNameText,
                title: 'Category Name',
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
