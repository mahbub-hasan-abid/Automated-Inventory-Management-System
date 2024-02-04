import 'package:flutter/material.dart';
import 'package:inventory_management/utils/custom_appbar.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppbar(),
          ListTile(
            title: Container(
              color: const Color.fromARGB(255, 2, 52, 94),
              child: const Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text(
                        '     No',
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 4,
                      child: Text(
                        'User Name',
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 6,
                      child: Text(
                        'Full Name',
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 4,
                      child: Text(
                        'Password',
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 4,
                      child: Text(
                        'Phone',
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        'Edit ',
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),

          //data will input here from databae
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: const Color.fromARGB(255, 2, 52, 94),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '  Manage Users',
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 15,
                child: Center(
                    child: IconButton(onPressed: () {}, icon: Icon(Icons.add))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
