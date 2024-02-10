import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/screens/order_module.dart';
import 'package:inventory_management/utils/custom_appbar.dart';
import 'package:inventory_management/utils/input_box.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  TextEditingController searchText = TextEditingController();
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
                        'Order ID',
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 2,
                      child: Text(
                        'Order Date',
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 3,
                      child: Text(
                        'Product ID',
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 6,
                      child: Text(
                        'Product Name',
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 3,
                      child: Text(
                        'Customer ID',
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 6,
                      child: Text(
                        'Customer Name',
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 2,
                      child: Text(
                        'Quantity ',
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 2,
                      child: Text(
                        'Price',
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 2,
                      child: Text(
                        'Total Amount',
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
            stream: FirebaseFirestore.instance.collection('orders').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              final fetchedData = snapshot.data!.docs;

              return ListView.builder(
                shrinkWrap: true,
                itemCount: fetchedData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Container(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Text(
                                '     $index',
                                //    style: TextStyle(color: Colors.white),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                fetchedData[index]['id'],
                                //  style: TextStyle(color: Colors.white),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                '3rd Dec',
                                //  style: TextStyle(color: Colors.white),
                              )),
                          Expanded(
                              flex: 3,
                              child: Text(
                                fetchedData[index]['product_id'],
                                // style: TextStyle(color: Colors.white),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                fetchedData[index]['product_name'],
                                // style: TextStyle(color: Colors.white),
                              )),
                          Expanded(
                              flex: 3,
                              child: Text(
                                fetchedData[index]['customer_id'],
                                //  style: TextStyle(color: Colors.white),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                fetchedData[index]['customer_name'],
                                //  style: TextStyle(color: Colors.white),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                fetchedData[index]['quantity'],
                                //   style: TextStyle(color: Colors.white),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                fetchedData[index]['price'],
                                //   style: TextStyle(color: Colors.white),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                fetchedData[index]['total'],
                                //    style: TextStyle(color: Colors.white),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                'Delete',
                                //    style: TextStyle(color: Colors.white),
                              ))
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
      bottomNavigationBar: Container(
        height: 80,
        color: const Color.fromARGB(255, 2, 52, 94),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '  Manage Order',
                  style: TextStyle(color: Colors.white),
                ),
                CustomInputBox(controller: searchText, title: 'Search')
              ],
            ),
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Text('Quantity  ', style: TextStyle(color: Colors.white)),
                  Text("  Total Amount", style: TextStyle(color: Colors.white))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text('Order   :   ', style: TextStyle(color: Colors.white)),
              //     Text('                #data from db  ',
              //         style: TextStyle(color: Colors.white)),
              //     Text("  #amount from db",
              //         style: TextStyle(color: Colors.white))
              //   ],
              // )
            ]),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 20,
                child: Center(
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderModule(),
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