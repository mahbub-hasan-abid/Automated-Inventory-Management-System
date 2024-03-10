import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/screens/user_module.dart';
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
                          flex: 4,
                          child: Text(
                            'Emai;',
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
                            'Role',
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
                stream:
                    FirebaseFirestore.instance.collection('users').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data == null) {
                    return Center(child: Text('No Data'));
                  }

                  final users = snapshot.data!.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final userData = users[index];
                      return ListTile(
                        title: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Text(
                                  '     $index',
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                )),
                            Expanded(
                                flex: 6,
                                child: Text(
                                  userData['name'],
                                  style: const TextStyle(color: Colors.black),
                                )),
                            Expanded(
                                flex: 4,
                                child: Text(
                                  userData['email'],
                                  style: const TextStyle(color: Colors.black),
                                )),
                            const Expanded(
                                flex: 4,
                                child: Text(
                                  '',
                                  style: TextStyle(color: Colors.black),
                                )),
                            Expanded(
                                flex: 4,
                                child: Text(
                                  userData['role'],
                                  style: const TextStyle(color: Colors.black),
                                )),
                            const Expanded(
                                flex: 1,
                                child: Text(
                                  'Edit ',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                )),
                            const Expanded(
                                flex: 1,
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 8, 8, 8)),
                                ))
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
                radius: 40,
                child: Center(
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserModule(),
                            ),
                          );
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
