import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/utils/card_main.dart';
import 'package:inventory_management/utils/chart.dart';
import 'package:inventory_management/utils/custom_appbar.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('products')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final response = snapshot.data!.docs;

                      return cardMain(name: 'Product', number: response.length);
                    }),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('customers')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final response = snapshot.data!.docs;

                      return cardMain(
                          name: 'Customer', number: response.length);
                    }),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('categories')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final response = snapshot.data!.docs;

                      return cardMain(
                          name: 'Categories', number: response.length);
                    }),
                cardMain(name: 'User', number: 57),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('orders')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final response = snapshot.data!.docs;

                      return cardMain(name: 'Orders', number: response.length);
                    }),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 42, 29, 156),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                height: 400,
                child: BarChartSample1(
                  product_value: 974,
                  customer_value: 1274,
                  categories_value: 37,
                  user_value: 57,
                  order_value: 74,
                ))
          ],
        ),
      ),
    );
  }
}
