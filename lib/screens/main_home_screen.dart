import 'package:flutter/material.dart';
import 'package:inventory_management/utils/card_main.dart';
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
      body: Column(
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
              cardMain(name: 'Product', number: 400),
              cardMain(name: 'Customer', number: 1200),
              cardMain(name: 'Categories', number: 30),
              cardMain(name: 'User', number: 50),
              cardMain(name: 'Order', number: 70),
            ],
          ),
        ],
      ),
    );
  }
}