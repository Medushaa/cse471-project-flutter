import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_um_try1/screens/model/item_model.dart';
import 'package:intl/intl.dart';

import '../home_page.dart';
import '../model/user_model.dart';

class itemCard extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  final itemModel _item;

  itemCard(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Color.fromARGB(255, 224, 224, 224),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text("Item Name: ${_item.itemName}"),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "  Donate",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Are you sure you wanna delete?"),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  child: Text(
                                    "Noh..",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                TextButton(
                                  child: Text(
                                    "Yess!",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  onPressed: () {
                                    //delete item
                                    // final uid = loggedInUser.uid;
                                    // var item_delete = FirebaseFirestore.instance
                                    //     .collection('users')
                                    //     .doc(user!.uid)
                                    //     .collection('items')
                                    //     .where("itemName",
                                    //         isEqualTo: "${_item.itemName}")
                                    //     .get()
                                    //     .then((QuerySnapshot snapshot) => {


                                    Fluttertoast.showToast(
                                        msg: "Nothing was Deleted");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                      "Expiry Date: ${DateFormat('MM/dd/yyyy').format(_item.expirydate!).toString()}"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
