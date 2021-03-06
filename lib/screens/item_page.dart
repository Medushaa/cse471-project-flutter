import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_um_try1/screens/add_item.dart';
import 'package:food_um_try1/screens/helpers/item_card.dart';
import 'package:food_um_try1/screens/model/item_model.dart';
import 'package:food_um_try1/screens/model/user_model.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  List<Object> _ItemList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getUsersItemList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: Icon(Icons.shopping_cart),
        title: Text(
          'Item Page',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _ItemList.length,
          itemBuilder: (content, index) {
            return itemCard(_ItemList[index] as itemModel);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddItemScreen()));
        }),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future getUsersItemList() async {
    final uid = loggedInUser.uid;
    var data = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('items')
        .get();

    setState(() {
      _ItemList = List.from(data.docs.map((doc) => itemModel.fromSnapshot(doc)));
    });
  }
}
