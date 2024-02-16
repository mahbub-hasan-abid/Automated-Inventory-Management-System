import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/screens/product_screen.dart';
import 'package:inventory_management/utils/custom_appbar.dart';
import 'package:inventory_management/utils/custom_dropdown.dart';
import 'package:inventory_management/utils/custome_button.dart';
import 'package:inventory_management/utils/flutter_toast.dart';
import 'package:inventory_management/utils/input_box.dart';

class ProductModule extends StatefulWidget {
  const ProductModule({super.key});

  @override
  State<ProductModule> createState() => _ProductModuleState();
}

class _ProductModuleState extends State<ProductModule> {
  TextEditingController productNameText = TextEditingController();

  TextEditingController quantityText = TextEditingController();

  TextEditingController priceText = TextEditingController();
  TextEditingController descriptionText = TextEditingController();

  TextEditingController categoryText = TextEditingController();

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
    if (productNameText.text.isEmpty ||
        quantityText.text.isEmpty ||
        descriptionText.text.isEmpty ||
        categoryText.text.isEmpty ||
        priceText.text.isEmpty) {
      showToastMessage('Please input first', context, false);
      return;
    }
    await FirebaseFirestore.instance.collection('products').add({
      'name': productNameText.text,
      'id': generateRandomID(),
      'stock': quantityText.text,
      'price': priceText.text,
      'description': descriptionText.text,
      'category': categoryText.text
    });
    showToastMessage('Product added!', context, true);

    if (context.mounted) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProductPage()));
    }
  }

  List<String> allCat = [];
  Future<bool> loadCategories() async {
    final rawResponse =
        await FirebaseFirestore.instance.collection('categories').get();
    final response = rawResponse.docs;
    for (var element in response) {
      allCat.add(element['name']);
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 154, 209, 235),
        child: FutureBuilder(
            future: loadCategories(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
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
                      child: const Hero(
                        tag: 'Product_page_to_module',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Product Module',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomInputBox(
                          controller: productNameText,
                          title: 'Product Name',
                        ),
                        CustomInputBox(
                          controller: quantityText,
                          title: ' Stock',
                        ),
                        CustomInputBox(
                          controller: priceText,
                          title: 'Price',
                        ),
                        CustomInputBox(
                          controller: descriptionText,
                          title: 'Description',
                        ),
                        CustomDropDown(
                          options: allCat,
                          title: 'Category',
                          controller: categoryText,
                        )
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
                      //   title: 'Update',
                      // ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: customButton(
                          title: 'Cancel',
                          startingColor: Colors.red.shade900,
                          endColor: Colors.red.shade300,
                        ),
                      )
                    ])
                  ],
                ),
              );
            }),
      ),
    );
  }
}
