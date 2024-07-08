import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inventory_management/screens/order_module.dart';
import 'package:inventory_management/utils/custom_appbar.dart';
import 'package:inventory_management/utils/generate_pdf.dart';
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
                          flex: 2,
                          child: Text(
                            'Product Name',
                            style: TextStyle(color: Colors.white),
                          )),
                      Expanded(
                          flex: 2,
                          child: Text(
                            'Customer ID',
                            style: TextStyle(color: Colors.white),
                          )),
                      Expanded(
                          flex: 5,
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
                            'Invoice',
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
                stream:
                    FirebaseFirestore.instance.collection('orders').snapshots(),
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
                      return ListTile(
                          title: Column(
                        children: [
                          Row(children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  '     ${index + 1}',
                                  //    style: TextStyle(color: Colors.white),
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  fetchedData[index]['id'],
                                  //  style: TextStyle(color: Colors.white),
                                )),
                            const Expanded(
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
                                flex: 2,
                                child: Text(
                                  fetchedData[index]['product_name'],
                                  // style: TextStyle(color: Colors.white),
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  fetchedData[index]['customer_id'],
                                  //  style: TextStyle(color: Colors.white),
                                )),
                            Expanded(
                                flex: 5,
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
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue),
                                    onPressed: () async {
                                      // await generateAndDownloadInvoice(
                                      //   customerAddress: 'Patuakhali',
                                      //   customerId: fetchedData[index]
                                      //       ['customer_id'],
                                      //   customerName: fetchedData[index]
                                      //       ['customer_name'],
                                      //   orderId: fetchedData[index]['id'],
                                      //   products: [
                                      //     {
                                      //       'price': double.tryParse(
                                      //               fetchedData[index]
                                      //                   ['price']) ??
                                      //           0,
                                      //       'name': fetchedData[index]
                                      //           ['product_name'],
                                      //       'id': fetchedData[index]
                                      //           ['product_id'],
                                      //       'quantity': double.tryParse(
                                      //           fetchedData[index]
                                      //                   ['quantity'] ??
                                      //               0)
                                      //     }
                                      //   ],
                                      //   total: double.tryParse(
                                      //           fetchedData[index]['total']) ??
                                      //       0,
                                      // );
                                    },
                                    child: const Text(
                                      'Generate',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ))),
                            const SizedBox(
                              width: 10,
                            ),
                            const Expanded(
                                flex: 2,
                                child: Text(
                                  'Delete',
                                  //    style: TextStyle(color: Colors.white),
                                )),
                          ]),
                          const Divider(
                            color: Color.fromARGB(
                                255, 0, 0, 0), // Set your desired color
                            height: 22.0, // Set the height of the line
                            thickness: 2.0, // Set the line thickness
                            indent: 10.0, // Indent the line from the left
                            endIndent: 10.0, // Indent the line from the right
                          ),
                        ],
                      ));
                    },
                  );
                },
              )
            ],
          ),
        ),
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
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 10),
                  child: Text(
                    '  Manage Order',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        ' Search',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 250,
                        height: 30,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your order id to search',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: const Text('Quantity                     ',
                        style: TextStyle(color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: const Text("  Total Amount",
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Order   :   ', style: TextStyle(color: Colors.white)),
                  Text('          120', style: TextStyle(color: Colors.white)),
                  Text("                                18490  ",
                      style: TextStyle(color: Colors.white))
                ],
              )
            ]),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderModule(),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
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
          ],
        ),
      ),
    );
  }
}
