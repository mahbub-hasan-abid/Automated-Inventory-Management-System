import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/screens/categories_module.dart';
import 'package:inventory_management/utils/custom_appbar.dart';
import 'package:inventory_management/utils/flutter_toast.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  void deleteCustomer(String docID) async {
    await FirebaseFirestore.instance
        .collection('categories')
        .doc(docID)
        .delete();
    showToastMessage('Category deleted', context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 154, 209, 235),
        child: SingleChildScrollView(
          child: Column(
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
                            '  Name',
                            style: TextStyle(color: Colors.white),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            '       Edit ',
                            style: TextStyle(color: Colors.white),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            '       Delete',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              ),

              //data will input here from databae
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('categories')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.data == null) {
                    return Center(child: Text('No Data'));
                  }
                  final fetchedData = snapshot.data!.docs;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: fetchedData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Text(
                                  '     $index',
                                  //   style: TextStyle(color: Colors.white),
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  fetchedData[index]['id'],
                                  // style: TextStyle(color: Colors.white),
                                )),
                            Expanded(
                                flex: 10,
                                child: Text(
                                  fetchedData[index]['name'],
                                  //   style: TextStyle(color: Colors.white),
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  'Edit ',
                                  // style: TextStyle(color: Colors.white),
                                )),
                            GestureDetector(
                              onTap: () {
                                deleteCustomer(fetchedData[index].id);
                              },
                              child: Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Delete',
                                    //  style: TextStyle(color: Colors.white),
                                  )),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        //height: 50,
        color: Color.fromARGB(255, 2, 52, 94),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '  Manage Categories',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Hero(
                tag: 'Product_page_to_module',
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoriesModule(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade800, Colors.blue.shade500],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
