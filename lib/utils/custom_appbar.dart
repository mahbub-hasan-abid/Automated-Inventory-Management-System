import 'package:flutter/material.dart';
import 'package:inventory_management/screens/categories_screen.dart';
import 'package:inventory_management/screens/customer_screen.dart';
import 'package:inventory_management/screens/main_home_screen.dart';
import 'package:inventory_management/screens/order_screen.dart';
import 'package:inventory_management/screens/product_screen.dart';
import 'package:inventory_management/screens/user_screen.dart';

class customAppbar extends StatelessWidget {
  const customAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                'assets/logo.jpeg',
                height: 100,
              ),
            ),
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Khan Sons Textile & Spinning Mill',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ))
              },
              child: Column(
                children: [
                  SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.asset('assets/home_iconfinder.png')),
                  Text('Home',
                      style:
                          TextStyle(color: const Color.fromARGB(255, 8, 0, 0)))
                ],
              ),
            ),
            InkWell(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(),
                    ))
              },
              child: Column(
                children: [
                  SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.asset('assets/product_home_iconfinder.png')),
                  Text('Products',
                      style:
                          TextStyle(color: const Color.fromARGB(255, 8, 0, 0)))
                ],
              ),
            ),
            InkWell(
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CustomerPage()))
              },
              child: Column(
                children: [
                  SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.asset('assets/customer_2_iconfinder.webp')),
                  Text('Customers',
                      style:
                          TextStyle(color: const Color.fromARGB(255, 8, 0, 0)))
                ],
              ),
            ),
            InkWell(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoriesPage(),
                    ))
              },
              child: Column(
                children: [
                  SizedBox(
                      width: 70,
                      height: 70,
                      child: Image.asset('assets/categories_iconfinder.webp')),
                  Text('Categories',
                      style:
                          TextStyle(color: const Color.fromARGB(255, 8, 0, 0)))
                ],
              ), // Replace with your image path
            ),
            InkWell(
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserPage()))
              },
              child: Column(
                children: [
                  SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.asset('assets/users_iconfinder.png')),
                  Text('Users',
                      style:
                          TextStyle(color: const Color.fromARGB(255, 8, 0, 0)))
                ],
              ), // Replace with your image path
            ),
            InkWell(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderPage(),
                    ))
              },
              child: Column(
                children: [
                  SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.asset('assets/order_iconfinder.png')),
                  Text('Orders',
                      style:
                          TextStyle(color: const Color.fromARGB(255, 8, 0, 0)))
                ],
              ), // Replace with your image path
            ), // Adjust text style as needed
          ],
        ),
      ],
    );
  }
}
