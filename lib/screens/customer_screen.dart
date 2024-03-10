import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/screens/customer_module.dart';
import 'package:inventory_management/utils/custom_appbar.dart';
import 'package:inventory_management/utils/flutter_toast.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  void deleteCustomer(String docID) async {
    await FirebaseFirestore.instance
        .collection('customers')
        .doc(docID)
        .delete();
    showToastMessage('Customer deleted', context, true);
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
                          flex: 1,
                          child: Text(
                            '     No',
                            style: TextStyle(color: Colors.white),
                          )),
                      Expanded(
                          flex: 2,
                          child: Text(
                            'Customer ID',
                            style: TextStyle(color: Colors.white),
                          )),
                      Expanded(
                          flex: 6,
                          child: Text(
                            'Name',
                            style: TextStyle(color: Colors.white),
                          )),
                      Expanded(
                          flex: 4,
                          child: Text(
                            'Phone',
                            style: TextStyle(color: Colors.white),
                          )),
                      Expanded(
                          flex: 5,
                          child: Text(
                            'Address',
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
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('customers')
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
                        title: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 29, 212, 5),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black)),
                          //  color: const Color.fromARGB(255, 2, 52, 94),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      '     $index',
                                      //  style: TextStyle(color: Colors.white),
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
                                    flex: 4,
                                    child: Text(
                                      fetchedData[index]['phone'],
                                      //    style: TextStyle(color: Colors.white),
                                    )),
                                Expanded(
                                    flex: 5,
                                    child: Text(
                                      fetchedData[index]['address'],
                                      //   style: TextStyle(color: Colors.white),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Edit ',
                                      //    style: TextStyle(color: Colors.white),
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    deleteCustomer(fetchedData[index].id);
                                  },
                                  child: Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Delete',
                                        //   style: TextStyle(color: Colors.white),
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
              '  Manage Customer',
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 40,
                child: Center(
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CustomerModule(),
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
