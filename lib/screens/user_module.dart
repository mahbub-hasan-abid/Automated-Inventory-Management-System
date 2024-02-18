import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/screens/user_screen.dart';
import 'package:inventory_management/utils/custom_appbar.dart';
import 'package:inventory_management/utils/custom_dropdown.dart';
import 'package:inventory_management/utils/custome_button.dart';
import 'package:inventory_management/utils/flutter_toast.dart';
import 'package:inventory_management/utils/input_box.dart';

class UserModule extends StatefulWidget {
  const UserModule({super.key});

  @override
  State<UserModule> createState() => _UserModuleState();
}

class _UserModuleState extends State<UserModule> {
  TextEditingController userEmailText = TextEditingController();

  TextEditingController fullNameText = TextEditingController();

  TextEditingController passwordText = TextEditingController();
  TextEditingController rePasswordText = TextEditingController();

  TextEditingController userRole = TextEditingController();

  void addUserToFirebase() async {
    if (userEmailText.text.contains('@') &&
        passwordText.text == rePasswordText.text) {
      try {
        final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: userEmailText.text, password: passwordText.text);
        if (user.user != null) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.user!.uid)
              .set({
            'name': fullNameText.text,
            'email': userEmailText.text,
            'role': userRole.text
          });
          showToastMessage('User has been added', context, true);
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        }
      } catch (e) {
        showToastMessage(e.toString(), context, false);
      }
    } else {
      showToastMessage('Invalid Input', context, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 154, 209, 235),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customAppbar(),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 35,
                color: const Color.fromARGB(255, 240, 21, 5),
                child: const Row(
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
                    controller: fullNameText,
                    title: 'User Name',
                  ),
                  CustomInputBox(
                    controller: userEmailText,
                    title: 'User Email',
                  ),
                  CustomInputBox(
                    controller: passwordText,
                    title: 'Password ',
                  ),
                  CustomInputBox(
                    controller: rePasswordText,
                    title: 'Re-type Password',
                  ),
                  CustomDropDown(
                    options: const [
                      'Supervisor',
                      'Stock Manager',
                      'Accountant',
                    ],
                    controller: userRole,
                    title: 'User Role',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                GestureDetector(
                  onTap: addUserToFirebase,
                  child: customButton(
                    title: 'Save',
                    startingColor: Colors.green.shade300,
                    endColor: Colors.green.shade900,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                // customButton(
                //   title: 'Update',
                // ),
                // SizedBox(
                //   width: 10,
                // ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: customButton(
                    title: 'Cancle',
                    startingColor: Colors.red.shade900,
                    endColor: Colors.red.shade300,
                  ),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
