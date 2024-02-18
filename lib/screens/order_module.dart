import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/model/customer_model.dart';
import 'package:inventory_management/model/product_model.dart';
import 'package:inventory_management/screens/order_screen.dart';
import 'package:inventory_management/utils/custom_appbar.dart';
import 'package:inventory_management/utils/custom_dropdown.dart';
import 'package:inventory_management/utils/custome_button.dart';
import 'package:inventory_management/utils/flutter_toast.dart';
import 'package:inventory_management/utils/input_box.dart';
import 'package:inventory_management/utils/search_box.dart';

class OrderModule extends StatefulWidget {
  const OrderModule({super.key});

  @override
  State<OrderModule> createState() => _OrderModuleState();
}

class _OrderModuleState extends State<OrderModule> {
  TextEditingController customerSearchText = TextEditingController();
  TextEditingController productSearchText = TextEditingController();
  TextEditingController customerIdText = TextEditingController();
  TextEditingController customerNameText = TextEditingController();
  TextEditingController productIdText = TextEditingController();
  TextEditingController productNameText = TextEditingController();
  TextEditingController priceText = TextEditingController();
  TextEditingController customerAddressText = TextEditingController();
  TextEditingController quantityText = TextEditingController();
  TextEditingController totalText = TextEditingController();
  List<CustomerModel> customers = [];
  List<ProductModel> products = [];

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

  void createOrder() async {
    if (customerNameText.text.isEmpty || productNameText.text.isEmpty) {
      showToastMessage('Please input first', context, false);

      return;
    }
    await FirebaseFirestore.instance.collection('orders').add({
      'id': generateRandomID(),
      'customer_id': customerIdText.text,
      'customer_name': customerNameText.text,
      'product_id': productIdText.text,
      'product_name': productNameText.text,
      'quantity': quantityText.text,
      'price': priceText.text,
      'total': totalText.text,
    });
    showToastMessage('Order has been created', context, true);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OrderPage()));
  }

  Future<bool> loadCustomerNames() async {
    final rawResponse =
        await FirebaseFirestore.instance.collection('customers').get();
    final response = rawResponse.docs;
    for (var element in response) {
      customers.add(CustomerModel.fromJson(element.data()));
    }

    final rawResponse1 =
        await FirebaseFirestore.instance.collection('products').get();
    final response1 = rawResponse1.docs;
    for (var element in response1) {
      products.add(ProductModel.fromJson(element.data()));
    }
    return true;
  }

  void autoFillCustomerData(String name) {
    final selectedCustomer =
        customers.firstWhere((element) => element.customerName == name);
    setState(() {
      customerIdText.text = selectedCustomer.id;
      customerNameText.text = selectedCustomer.customerName;
      customerAddressText.text = selectedCustomer.address;
    });
  }

  void autoFillProductData(String name) {
    final selectedCustomer =
        products.firstWhere((element) => element.productName == name);
    setState(() {
      productNameText.text = selectedCustomer.productName;
      productIdText.text = selectedCustomer.id;
      priceText.text = selectedCustomer.price;
    });
  }

  var isLoaded;

  @override
  void initState() {
    super.initState();
    isLoaded = loadCustomerNames();
    customerSearchText.addListener(() {
      if (customerSearchText.text.isNotEmpty) {
        autoFillCustomerData(customerSearchText.text);
      }
    });
    productSearchText.addListener(() {
      if (productSearchText.text.isNotEmpty) {
        autoFillProductData(productSearchText.text);
      }
    });

    quantityText.addListener(() {
      int quantity = int.tryParse(quantityText.text) ?? 0;
      setState(() {
        double price = double.tryParse(priceText.text) ?? 0.00;
        totalText.text = (price * quantity).toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 154, 209, 235),
        child: FutureBuilder(
            future: isLoaded,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customAppbar(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            color: const Color.fromARGB(255, 240, 21, 5),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Order Module',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            )),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(35)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'CUSTOMER',
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .30,
                                  child: CustomDropDown(
                                    controller: customerSearchText,
                                    options: customers
                                        .map((e) => e.customerName)
                                        .toList(),
                                    title: 'Search',
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomSearchBox(
                                  controller: customerIdText,
                                  title: 'Customer Id',
                                  wd: .3,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomSearchBox(
                                  controller: customerNameText,
                                  title: 'Customer Name',
                                  wd: .3,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomSearchBox(
                                  controller: customerAddressText,
                                  title: 'Customer Address',
                                  wd: .3,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(35)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'PRODUCT',
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              //under the product text   2 colums in 1 row

                              Container(
                                width: MediaQuery.of(context).size.width * .65,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CustomDropDown(
                                            controller: productSearchText,
                                            title: 'Search',
                                            options: products
                                                .map((e) => e.productName)
                                                .toList(),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CustomInputBox(
                                              controller: productIdText,
                                              title: 'Product ID'),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          CustomInputBox(
                                              controller: productNameText,
                                              title: "Product Name"),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CustomInputBox(
                                              controller: priceText,
                                              title: 'Price'),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CustomInputBox(
                                              controller: quantityText,
                                              title: "Quantity"),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          CustomInputBox(
                                              controller: totalText,
                                              title: "Total"),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                        onTap: createOrder,
                                        child: customButton(
                                          title: 'Order Insert',
                                          startingColor: Colors.green.shade300,
                                          endColor: Colors.green.shade900,
                                        )),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: customButton(
                                        title: 'Cancle',
                                        startingColor: Colors.red.shade900,
                                        endColor: Colors.red.shade300,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ]),
              );
            }),
      ),
    );
  }
}
