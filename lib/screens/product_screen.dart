import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
                            'Product ID',
                            style: TextStyle(color: Colors.white),
                          )),
                      Expanded(
                          flex: 6,
                          child: Text(
                            'Name',
                            style: TextStyle(color: Colors.white),
                          )),
                      Expanded(
                          flex: 2,
                          child: Text(
                            'Stock',
                            style: TextStyle(color: Colors.white),
                          )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            'Price',
                            style: TextStyle(color: Colors.white),
                          )),
                      Expanded(
                          flex: 8,
                          child: Text(
                            'Description',
                            style: TextStyle(color: Colors.white),
                          )),
                      Expanded(
                          flex: 4,
                          child: Text(
                            'Category',
                            style: TextStyle(color: Colors.white),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            'Edit ',
                            style: TextStyle(color: Colors.white),
                          )),
                      Expanded(
                          flex: 2,
                          child: Text(
                            'Delete',
                            style: TextStyle(color: Colors.white),
                          ))
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
                            // color: const Color.fromARGB(255, 2, 52, 94),
                            child: Row(
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
                                      //  style: TextStyle(color: Colors.white),
                                    )),
                                Expanded(
                                    flex: 6,
                                    child: Text(
                                      fetchedData[index]['name'],
                                      //  style: TextStyle(color: Colors.white),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      fetchedData[index]['stock'],
                                      //   style: TextStyle(color: Colors.white),
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Text(
                                      fetchedData[index]['price'],
                                      //  style: TextStyle(color: Colors.white),
                                    )),
                                Expanded(
                                    flex: 8,
                                    child: Text(
                                      fetchedData[index]['description'],
                                      //   style: TextStyle(color: Colors.white),
                                    )),
                                Expanded(
                                    flex: 4,
                                    child: Text(
                                      fetchedData[index]['category'],
                                      //  style: TextStyle(color: Colors.white),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Edit ',
                                      //   style: TextStyle(color: Colors.white),
                                    )),
                                GestureDetector(
                                  onTap: () async {
                                    await deleteProduct(fetchedData[index].id);
                                  },
                                  child: Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Delete',
                                        //  style: TextStyle(color: Colors.white),
                                      )),
                                )
                              ],
                            ),
                          ),
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
              child: Hero(
                tag: 'Product_page_to_module',
                child: CircleAvatar(
                  radius: 40,
                  child: Stack(children: [
                    Center(
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductModule(),
                                  ));
                            },
                            icon: Icon(Icons.add))),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
