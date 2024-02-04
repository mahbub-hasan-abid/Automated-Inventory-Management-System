import 'package:flutter/material.dart';
import 'package:inventory_management/utils/custom_appbar.dart';
import 'package:inventory_management/utils/custome_button.dart';
import 'package:inventory_management/utils/input_box.dart';
import 'package:inventory_management/utils/search_box.dart';

class OrderModule extends StatefulWidget {
  const OrderModule({super.key});

  @override
  State<OrderModule> createState() => _OrderModuleState();
}

class _OrderModuleState extends State<OrderModule> {
  TextEditingController customerSearchText = TextEditingController();
  TextEditingController productSearchText = TextEditingController();
  TextEditingController customerIdText = TextEditingController();
  TextEditingController customerNameText = TextEditingController();
  TextEditingController productIdText = TextEditingController();
  TextEditingController productNameText = TextEditingController();
  TextEditingController priceText = TextEditingController();
  TextEditingController quantityText = TextEditingController();
  TextEditingController totalText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        customAppbar(),
        Container(
            color: const Color.fromARGB(255, 240, 21, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Order Module',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            )),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    color: const Color.fromARGB(255, 2, 52, 94),
                    width: MediaQuery.of(context).size.width * .3,
                    child: Column(
                      children: [
                        Row(children: [
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  ' No',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Text('Customer Id',
                                  style: TextStyle(color: Colors.white))),
                          Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Name',
                                    style: TextStyle(color: Colors.white)),
                              )),
                        ]),
                      ],
                    )),
                Container(
                    height: 100,
                    child: Text('#here data will be inputed from customer db')),
                CustomSearchBox(
                    controller: customerSearchText, title: 'Search', wd: .2),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'CUSTOMER',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                    ),
                  ),
                ),
                CustomSearchBox(
                  controller: customerIdText,
                  title: 'Customer Id',
                  wd: .3,
                ),
                CustomSearchBox(
                  controller: customerNameText,
                  title: 'Customer Name',
                  wd: .3,
                ),
              ],
            ),
            SizedBox(
              width: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: const Color.fromARGB(255, 2, 52, 94),
                  width: MediaQuery.of(context).size.width * .65,
                  child: Row(children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ' No',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Text('Product Id',
                            style: TextStyle(color: Colors.white))),
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Name',
                              style: TextStyle(color: Colors.white)),
                        )),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Quantity',
                              style: TextStyle(color: Colors.white)),
                        )),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Price',
                              style: TextStyle(color: Colors.white)),
                        )),
                    Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Description',
                              style: TextStyle(color: Colors.white)),
                        )),
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Category',
                              style: TextStyle(color: Colors.white)),
                        )),
                  ]),
                ),
                Container(
                    height: 100,
                    child: Text('#here data will be inputed from product db')),
                CustomSearchBox(
                    controller: productSearchText, title: 'Search', wd: .2),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'PRODUCT',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                    ),
                  ),
                ),

                //under the product text   2 colums in 1 row

                Container(
                  width: MediaQuery.of(context).size.width * .65,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            children: [
                              CustomInputBox(
                                  controller: productIdText,
                                  title: 'Product ID'),
                              CustomInputBox(
                                  controller: productNameText,
                                  title: "Product Name"),
                              ElevatedButton(
                                  onPressed: () async {
                                    DateTime? datepic = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2023),
                                        lastDate: DateTime(2025));
                                    if (datepic != null) {
                                      print('date picked : ${datepic.day}');
                                    }
                                  },
                                  child: Text("show")),
                              ElevatedButton(
                                  onPressed: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now(),
                                            initialEntryMode:
                                                TimePickerEntryMode.input);
                                    if (pickedTime != null)
                                      print(
                                          "time selected : ${pickedTime.hour}: ${pickedTime.minute}");
                                  },
                                  child: Text("pick time"))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            children: [
                              CustomInputBox(
                                  controller: priceText, title: 'Price'),
                              CustomInputBox(
                                  controller: quantityText, title: "Quantity"),
                              CustomInputBox(
                                  controller: totalText, title: "Total"),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  customButton(title: 'Order Insert'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  customButton(title: 'clear'),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
