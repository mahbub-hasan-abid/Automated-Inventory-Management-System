import 'package:flutter/material.dart';
import 'package:inventory_management/screens/categories_screen.dart';
import 'package:inventory_management/screens/customer_screen.dart';
import 'package:inventory_management/screens/main_home_screen.dart';
import 'package:inventory_management/screens/order_screen.dart';
import 'package:inventory_management/screens/product_screen.dart';
import 'package:inventory_management/screens/transaction_screen.dart';
import 'package:inventory_management/screens/user_screen.dart';

class customAppbar extends StatefulWidget {
  customAppbar({super.key});

  @override
  State<customAppbar> createState() => _customAppbarState();
}

class _customAppbarState extends State<customAppbar> {
  bool home_isHovered = false;
  bool product_isHovered = false;
  bool customer_isHovered = false;
  bool categories_isHovered = false;
  bool user_isHovered = false;
  bool order_isHovered = false;
  bool transaction_isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                'assets/logo2.png',
                height: 170,
              ),
            ),
            const Expanded(
              child: Text(
                'Inventory Management and Automation System',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ))
              },
              child: Column(
                children: [
                  MouseRegion(
                    onEnter: (_) => setState(() => home_isHovered = true),
                    onExit: (_) {
                      setState(() {
                        home_isHovered = false;
                      });
                    },
                    child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: home_isHovered ? 100 : 80,
                        height: home_isHovered ? 100 : 80,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 95, 182, 116),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/home_iconfinder.png'),
                        )),
                  ),
                  const Text('Home',
                      style: TextStyle(color: Color.fromARGB(255, 8, 0, 0)))
                ],
              ),
            ),
            InkWell(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductPage(),
                    ))
              },
              child: Column(
                children: [
                  MouseRegion(
                    onEnter: (_) => setState(() => product_isHovered = true),
                    onExit: (_) {
                      setState(() {
                        product_isHovered = false;
                      });
                    },
                    child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: product_isHovered ? 100 : 80,
                        height: product_isHovered ? 100 : 80,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 95, 182, 116),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                                'assets/product_home_iconfinder.png'))),
                  ),
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
                  MouseRegion(
                    onEnter: (_) => setState(() => customer_isHovered = true),
                    onExit: (_) {
                      setState(() {
                        customer_isHovered = false;
                      });
                    },
                    child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: customer_isHovered ? 100 : 80,
                        height: customer_isHovered ? 100 : 80,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 95, 182, 116),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                                'assets/customer_2_iconfinder.webp'))),
                  ),
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
                  MouseRegion(
                    onEnter: (_) => setState(() => categories_isHovered = true),
                    onExit: (_) {
                      setState(() {
                        categories_isHovered = false;
                      });
                    },
                    child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: categories_isHovered ? 100 : 80,
                        height: categories_isHovered ? 100 : 80,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 95, 182, 116),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                                'assets/categories_iconfinder.webp'))),
                  ),
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
                  MouseRegion(
                    onEnter: (_) => setState(() => user_isHovered = true),
                    onExit: (_) {
                      setState(() {
                        user_isHovered = false;
                      });
                    },
                    child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: user_isHovered ? 100 : 80,
                        height: user_isHovered ? 100 : 80,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 95, 182, 116),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/users_iconfinder.png'))),
                  ),
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
                      builder: (context) => TransactionPage(),
                    ))
              },
              child: Column(
                children: [
                  MouseRegion(
                    onEnter: (_) =>
                        setState(() => transaction_isHovered = true),
                    onExit: (_) {
                      setState(() {
                        transaction_isHovered = false;
                      });
                    },
                    child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: transaction_isHovered ? 100 : 80,
                        height: transaction_isHovered ? 100 : 80,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 95, 182, 116),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                                'assets/transaction_2_iconfinder.png'))),
                  ),
                  Text('Transaction',
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
                  MouseRegion(
                    onEnter: (_) => setState(() => order_isHovered = true),
                    onExit: (_) {
                      setState(() {
                        order_isHovered = false;
                      });
                    },
                    child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: order_isHovered ? 100 : 80,
                        height: order_isHovered ? 100 : 80,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 95, 182, 116),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/order_iconfinder.png'))),
                  ),
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
