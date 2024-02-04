import 'package:flutter/material.dart';
import 'package:inventory_management/utils/custom_appbar.dart';
import 'package:inventory_management/utils/input_box.dart';

class UserModule extends StatefulWidget {
  const UserModule({super.key});

  @override
  State<UserModule> createState() => _UserModuleState();
}

class _UserModuleState extends State<UserModule> {
  TextEditingController userName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const customAppbar(),
          const SizedBox(
            height: 20,
          ),
          Container(
              color: const Color.fromARGB(255, 243, 19, 3),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'User Module ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          CustomInputBox(
            controller: userName,
            title: 'User Name: ',
          ),
          CustomInputBox(
            controller: userName,
            title: 'Email: ',
          ),
          CustomInputBox(
            controller: userName,
            title: 'Phone: ',
          ),
          CustomInputBox(
            controller: userName,
            title: 'User Name: ',
          ),
        ],
      ),
    );
  }
}
