import 'package:flutter/material.dart';
import 'package:inventory_management/screens/categories_screen.dart';
import 'package:inventory_management/screens/customer_screen.dart';
import 'package:inventory_management/screens/home_page.dart';
import 'package:inventory_management/screens/main_home_screen.dart';
import 'package:inventory_management/screens/order_screen.dart';
import 'package:inventory_management/screens/product_screen.dart';
import 'package:inventory_management/screens/transaction_screen.dart';
import 'package:inventory_management/screens/user_screen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    var wd = MediaQuery.of(context).size.width;
    return SizedBox(
      width: MediaQuery.of(context).size.width * .15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: ht * .01,
          ),
          Container(
            //width: MediaQuery.of(context).size.width * .20,
            padding: const EdgeInsets.all(3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/khansons2.png',
                  fit: BoxFit.cover,
                ),
                SizedBox(height: ht * .01),
                Text(
                  '  We beleive in Quality',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: ht * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: ht * 0.01),
          buildOptionTile('Home', 'assets/home_iconfinder.png', HomeScreen()),
          SizedBox(height: ht * .01),
          buildOptionTile(
              'Products', 'assets/product_home_iconfinder.png', ProductPage()),
          SizedBox(height: ht * .01),
          buildOptionTile(
              'Customer', 'assets/customer_2_iconfinder.webp', CustomerPage()),
          SizedBox(height: ht * .01),
          buildOptionTile('Categories', 'assets/categories_iconfinder.webp',
              CategoriesPage()),
          SizedBox(height: ht * .01),
          buildOptionTile('Users', 'assets/users_iconfinder.png', UserPage()),
          SizedBox(height: ht * .01),
          buildOptionTile('Transactions', 'assets/transaction_2_iconfinder.png',
              TransactionPage()),
          SizedBox(height: ht * .01),
          buildOptionTile('Orders', 'assets/order_iconfinder.png', OrderPage()),
        ],
      ),
    );
  }

  Widget buildOptionTile(String title, String iconPath, var pageName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
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
              const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
          leading: Image.asset(
            iconPath,
            width: 35,
            height: 35,
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => pageName,
                  ));
            });
          },
        ),
      ),
    );
  }
}
