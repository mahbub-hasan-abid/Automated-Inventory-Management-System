import 'package:flutter/material.dart';
import 'package:inventory_management/screens/categories_module.dart';
import 'package:inventory_management/utils/custom_appbar.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
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
                      flex: 2,
                      child: Text(
                        'Category ID',
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 10,
                      child: Text(
                        'Name',
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
              '  Manage Product',
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 15,
                child: Center(
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoriesModule(),
                              ));
                        },
                        icon: Icon(Icons.add))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
