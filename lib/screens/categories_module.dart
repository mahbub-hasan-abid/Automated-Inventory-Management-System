import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/screens/categories_screen.dart';
import 'package:inventory_management/utils/custom_appbar.dart';
import 'package:inventory_management/utils/custome_button.dart';
import 'package:inventory_management/utils/flutter_toast.dart';
import 'package:inventory_management/utils/input_box.dart';

class CategoriesModule extends StatefulWidget {
  const CategoriesModule({super.key});

  @override
  State<CategoriesModule> createState() => _CategoriesModuleState();
}

class _CategoriesModuleState extends State<CategoriesModule> {
  TextEditingController categoryNameText = TextEditingController();

  String generateRandomID() {
    const _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    final _rnd = Random();

    String getRandomString(int length) => String.fromCharCodes(
          Iterable.generate(
            length,
            (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
          ),
        );

    return getRandomString(4); // Generate a 4-letter random ID
  }

  void uploadToFirebase() async {
    if (categoryNameText.text.isEmpty) {
      showToastMessage('Please input first', context, false);
      return;
    }
    await FirebaseFirestore.instance
        .collection('categories')
        .add({'name': categoryNameText.text, 'id': generateRandomID()});
    showToastMessage('Category added!', context, true);
    setState(() {
      categoryNameText.text = '';
    });
    if (context.mounted) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CategoriesPage()));
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
                  SizedBox(
                    height: 10,
                  ),
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
                GestureDetector(
                    onTap: uploadToFirebase,
                    child: customButton(
                      title: 'Save',
                      startingColor: Colors.green.shade300,
                      endColor: Colors.green.shade900,
                    )),
                SizedBox(
                  width: 10,
                ),
                // customButton(
                //   buttonColor: Colors.green,
                //   title: 'Update',
                // ),
                // SizedBox(
                //   width: 10,
                // ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: customButton(
                    startingColor: Colors.red.shade900,
                    endColor: Colors.red.shade300,
                    title: 'Cancel',
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
