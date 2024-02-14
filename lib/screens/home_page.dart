import 'package:flutter/material.dart';
import 'package:inventory_management/screens/categories_screen.dart';
import 'package:inventory_management/screens/customer_screen.dart';
import 'package:inventory_management/screens/order_screen.dart';
import 'package:inventory_management/screens/product_screen.dart';
import 'package:inventory_management/screens/user_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 154, 209, 235),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28),
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
                            builder: (context) => ProductPage(),
                          ))
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/product_50px.png'),
                        Text('Products',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 8, 0, 0)))
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomerPage()))
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/user_50px.png'),
                        Text('Customers',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 8, 0, 0)))
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
                        Image.asset('assets/categ_50px.png'),
                        Text('Categories',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 8, 0, 0)))
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
                        Image.asset('assets/customer_50px.png'),
                        Text('Users',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 8, 0, 0)))
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
                        Image.asset('assets/order_50px.png'),
                        Text('Orders',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 8, 0, 0)))
                      ],
                    ), // Replace with your image path
                  ), // Adjust text style as needed
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
