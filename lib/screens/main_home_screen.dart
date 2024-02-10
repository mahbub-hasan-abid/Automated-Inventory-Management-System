import 'package:flutter/material.dart';
import 'package:inventory_management/utils/card_main.dart';
import 'package:inventory_management/utils/chart.dart';
import 'package:inventory_management/utils/custom_appbar.dart';

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
            customAppbar(),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cardMain(name: 'Product', number: 974),
                cardMain(name: 'Customer', number: 1274),
                cardMain(name: 'Categories', number: 37),
                cardMain(name: 'User', number: 57),
                cardMain(name: 'Order', number: 74),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
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
