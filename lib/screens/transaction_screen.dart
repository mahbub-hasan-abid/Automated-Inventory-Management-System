import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management/screens/product_module.dart';
import 'package:inventory_management/screens/transaction_module.dart';
import 'package:inventory_management/utils/custom_appbar.dart';
import 'package:inventory_management/utils/flutter_toast.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  // Future<void> deleteProduct(String docID) async {
  //   await FirebaseFirestore.instance.collection('products').doc(docID).delete();
  //   showToastMessage('Items has been deleted');
  // }

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
                            'Date',
                            style: TextStyle(color: Colors.white),
                          )),
                      Expanded(
                          flex: 6,
                          child: Text(
                            'Description',
                            style: TextStyle(color: Colors.white),
                          )),
                      Expanded(
                          flex: 2,
                          child: Text(
                            'Type',
                            style: TextStyle(color: Colors.white),
                          )),
                      Expanded(
                          flex: 2,
                          child: Text(
                            'Amount',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
              ),

              //       data will input here from databae
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('transactions')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.data == null) {
                    return Center(child: Text('No Data'));
                  }
                  final fetchedData = snapshot.data!.docs;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: fetchedData.length,
                    itemBuilder: (context, index) {
                      final info = fetchedData[index];
                      return Card(
                        elevation: 3,
                        color: const Color.fromARGB(255, 192, 188, 188),
                        child: ListTile(
                          title: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    '     $index',
                                    style: const TextStyle(color: Colors.black),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    DateFormat('dd MMM, yyyy').format(
                                        (info['date'] as Timestamp).toDate()),
                                    style: TextStyle(color: Colors.black),
                                  )),
                              Expanded(
                                  flex: 6,
                                  child: Text(
                                    '${info['desc']}',
                                    style: TextStyle(color: Colors.black),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    ' ${info['type']}',
                                    style: TextStyle(color: Colors.black),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    ' ${info['amount']}',
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ],
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
        //height: 50,
        color: Color.fromARGB(255, 2, 52, 94),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '  Manage Transaction',
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
                        builder: (context) => TransactionModule(),
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
