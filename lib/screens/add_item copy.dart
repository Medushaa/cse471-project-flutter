import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_um_try1/screens/profile_page.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({ Key? key }) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}


class _AddItemScreenState extends State<AddItemScreen> {

  final _auth = FirebaseAuth.instance;
  

  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final ItemNameEditingController = new TextEditingController();
  final ExpiryDateEditingController = new TextEditingController();
  


  
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.deepOrange,
          leading: Icon(Icons.add),
          title: Text('Add Item',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter item name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your username',
                ),
              ),
            ),
          ],
        ),
    );
  }
