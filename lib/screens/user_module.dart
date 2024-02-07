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
  TextEditingController userNameText = TextEditingController();

  TextEditingController fullNameText = TextEditingController();

  TextEditingController passwordText = TextEditingController();
  TextEditingController rePasswordText = TextEditingController();

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
                  'User Module',
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
                controller: userNameText,
                title: 'User Name',
              ),
              CustomInputBox(
                controller: fullNameText,
                title: ' Full Name',
              ),
              CustomInputBox(
                controller: passwordText,
                title: 'Password ',
              ),
              CustomInputBox(
                controller: rePasswordText,
                title: 'Re-type Password',
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
            customButton(
              title: 'Save',
            ),
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
