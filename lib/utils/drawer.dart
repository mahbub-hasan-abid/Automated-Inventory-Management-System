import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/logo2.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 15),
              const Text(
                'Khan Sons and Textile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 60),
        buildOptionTile(
          'Home',
          'assets/home_iconfinder.png',
        ),
        SizedBox(height: 15),
        buildOptionTile(
          'Products',
          'assets/product_home_iconfinder.png',
        ),
        SizedBox(height: 15),
        buildOptionTile(
          'Customer',
          'assets/customer_2_iconfinder.webp',
        ),
        SizedBox(height: 15),
        buildOptionTile(
          'Categories',
          'assets/categories_iconfinder.webp',
        ),
        SizedBox(height: 15),
        buildOptionTile(
          'Users',
          'assets/users_iconfinder.png',
        ),
        SizedBox(height: 15),
        buildOptionTile(
          'Transactions',
          'assets/transaction_2_iconfinder.png',
        ),
        SizedBox(height: 15),
        buildOptionTile(
          'Orders',
          'assets/order_iconfinder.png',
        ),
      ],
    );
  }

  Widget buildOptionTile(String title, String iconPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Material(
        color: selectedOption == title
            ? Colors.blue.withOpacity(0.3)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          leading: Image.asset(
            iconPath,
            width: 32,
            height: 32,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: selectedOption == title ? Colors.blue : Colors.white,
              fontSize: 20,
            ),
          ),
          onTap: () {
            setState(() {
              selectedOption = title;
            });
          },
        ),
      ),
    );
  }
}
