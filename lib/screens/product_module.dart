import 'package:flutter/material.dart';
import 'package:inventory_management/utils/custom_appbar.dart';
import 'package:inventory_management/utils/custome_button.dart';
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
                  'Product Module',
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
                controller: productNameText,
                title: 'Product Name',
              ),
              CustomInputBox(
                controller: quantityText,
                title: ' Quantity',
              ),
              CustomInputBox(
                controller: priceText,
                title: 'Price',
              ),
              CustomInputBox(
                controller: descriptionText,
                title: 'Description',
              ),
              CustomInputBox(
                controller: categoryText,
                title: 'category',
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
