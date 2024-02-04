import 'package:flutter/material.dart';

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
              onTap: () => {},
              child: Column(
                children: [
                  Image.asset('assets/product_50px.png'),
                  Text('Product',
                      style:
                          TextStyle(color: const Color.fromARGB(255, 8, 0, 0)))
                ],
              ), // Replace with your image path
            ),
            InkWell(
              onTap: () => {},
              child: Column(
                children: [
                  Image.asset('assets/user_50px.png'),
                  Text('Customer',
                      style:
                          TextStyle(color: const Color.fromARGB(255, 8, 0, 0)))
                ],
              ), // Replace with your image path
            ),
            InkWell(
              onTap: () => {},
              child: Column(
                children: [
                  Image.asset('assets/categ_50px.png'),
                  Text('Categories',
                      style:
                          TextStyle(color: const Color.fromARGB(255, 8, 0, 0)))
                ],
              ), // Replace with your image path
            ),
            InkWell(
              onTap: () => {},
              child: Column(
                children: [
                  Image.asset('assets/customer_50px.png'),
                  Text('Users',
                      style:
                          TextStyle(color: const Color.fromARGB(255, 8, 0, 0)))
                ],
              ), // Replace with your image path
            ),
            InkWell(
              onTap: () => {},
              child: Column(
                children: [
                  Image.asset('assets/order_50px.png'),
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
