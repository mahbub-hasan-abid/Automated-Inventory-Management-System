import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inventory_management/screens/product_module.dart';
import 'package:inventory_management/utils/custom_appbar.dart';
import 'package:inventory_management/utils/flutter_toast.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<void> deleteProduct(String docID) async {
    await FirebaseFirestore.instance.collection('products').doc(docID).delete();
    showToastMessage('Items has been deleted', context, true);
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * .965,
                  color: const Color.fromARGB(255, 2, 52, 94),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width *
                            (2 * 0.03), // No
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '    No',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width *
                            (2 * 0.03), // Product ID
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Product ID',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width *
                            (4 * 0.03), // Name
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Name',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width *
                            (2 * 0.0333), // Stock
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Stock',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width *
                            (3 * 0.0333), // Price
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Price',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width *
                            (8 * 0.0333), // Description
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Description',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width *
                            (4 * 0.0333), // Category
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Category',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width *
                            (2 * 0.0333), // Edit
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Edit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width *
                            (2 * 0.0333), // Delete
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Delete',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //data will input here from databae
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('products')
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
                      return Card(
                          elevation: 3,
                          color: Color.fromARGB(255, 192, 188, 188),
                          child: ListTile(
                              title: Container(
                                  //  color: Color.fromARGB(255, 14, 209, 20),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                Container(
                                  width: MediaQuery.of(context).size.width *
                                      (2 * 0.03), // Flex: 2
                                  child: Text(
                                    '     $index',
                                    //   style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width *
                                      (2 * 0.03), // Flex: 3
                                  child: Text(
                                    fetchedData[index]['id'],
                                    //  style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width *
                                      (4 * 0.03), // Flex: 6
                                  child: Text(
                                    fetchedData[index]['name'],
                                    //  style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width *
                                      (2 * 0.0333), // Flex: 2
                                  child: Text(
                                    " ${fetchedData[index]['stock']}",
                                    //   style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width *
                                      (3 * 0.0333), // Flex: 3
                                  child: Text(
                                    "  ${fetchedData[index]['price']}",
                                    //  style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width *
                                      (8 * 0.0333), // Flex: 8
                                  child: Text(
                                    " ${fetchedData[index]['description']}",
                                    //   style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width *
                                      (4 * 0.0333), // Flex: 4
                                  child: Text(
                                    " ${fetchedData[index]['category']}",
                                    //  style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width *
                                      (2 * 0.0333), // Flex: 1
                                  child: Text(
                                    ' Edit ',
                                    //   style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await deleteProduct(fetchedData[index].id);
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        (2 * 0.0333), // Flex: 2
                                    child: Text(
                                      ' Delete',
                                      //  style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ]))));
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
              '  Manage Products',
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
                        builder: (context) => ProductModule(),
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
