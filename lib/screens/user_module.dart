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
          customAppbar(),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [Text('User Name :'), Expanded(child: CustomInputBox())],
          ),
        ],
      ),
    );
  }
}
