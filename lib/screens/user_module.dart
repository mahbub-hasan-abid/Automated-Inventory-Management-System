import 'package:flutter/material.dart';
import 'package:inventory_management/utils/custom_appbar.dart';
import 'package:inventory_management/utils/input_box.dart';

class UserModule extends StatefulWidget {
  const UserModule({super.key});

  @override
  State<UserModule> createState() => _UserModuleState();
}

class _UserModuleState extends State<UserModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //   customAppbar(),
          SizedBox(
            height: 20,
          ),
          Container(
              //height: 40,

              color: const Color.fromARGB(255, 243, 19, 3),
              child: Row(
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
          Row(
            children: [
              Text(
                'Username  :',
              ),
              CustomInputBox()
            ],
          )
        ],
      ),
    );
  }
}
