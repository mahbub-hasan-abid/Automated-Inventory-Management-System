import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/screens/categories_module.dart';
import 'package:inventory_management/screens/customer_module.dart';
import 'package:inventory_management/screens/order_module.dart';
import 'package:inventory_management/screens/product_module.dart';
import 'package:inventory_management/screens/user_module.dart';
import 'package:inventory_management/utils/card_main.dart';
import 'package:inventory_management/utils/chart.dart';
import 'package:inventory_management/utils/custom_appbar.dart';
import 'package:inventory_management/utils/custom_container_box.dart';
import 'package:inventory_management/utils/generate_pdf.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const customAppbar(),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('products')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final response = snapshot.data!.docs;

                          return cardMain(
                              name: 'Products', number: response.length);
                        }),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('customers')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final response = snapshot.data!.docs;

                          return cardMain(
                              name: 'Customers', number: response.length);
                        }),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('categories')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final response = snapshot.data!.docs;

                          return cardMain(
                              name: 'Categories', number: response.length);
                        }),
                    const cardMain(name: 'Users', number: 57),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('orders')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final response = snapshot.data!.docs;

                          return cardMain(
                              name: 'Orders', number: response.length);
                        }),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 42, 29, 156),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        height: 400,
                        child: BarChartSample1(
                          product_value: 974,
                          customer_value: 1274,
                          categories_value: 37,
                          user_value: 57,
                          order_value: 74,
                        )),
                    Column(children: [
                      CustomContaineBox(
                        startingColor: Colors.blue.shade200,
                        endColor: Colors.blue.shade900,
                        text: 'Add Product',
                        imageUrl: "assets/product_iconfinder.webp",
                        page: ProductModule(),
                      ),
                      CustomContaineBox(
                          startingColor: Colors.green.shade200,
                          endColor: Colors.green.shade900,
                          page: CustomerModule(),
                          text: "Add Customer",
                          imageUrl: "assets/customer2_iconfinder.png"),
                      CustomContaineBox(
                          startingColor: Colors.yellowAccent.shade200,
                          endColor: Colors.yellow.shade900,
                          page: CategoriesModule(),
                          text: "Add Category",
                          imageUrl: "assets/caterories_2_iconfinder.png"),
                      CustomContaineBox(
                          startingColor: Colors.red.shade200,
                          endColor: Colors.red.shade900,
                          page: UserModule(),
                          text: "Add Users",
                          imageUrl: "assets/users_2_iconfinder.png"),
                      CustomContaineBox(
                          endColor: const Color.fromARGB(255, 255, 255, 255),
                          startingColor: const Color.fromARGB(255, 87, 1, 47),
                          page: OrderModule(),
                          text: "Add Orders",
                          imageUrl: "assets/order_2_iconfinder.png"),
                    ]),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
