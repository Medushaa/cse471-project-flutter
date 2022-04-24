import 'package:flutter/material.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({ Key? key }) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Center(child: Text('I want a form here to addd iteemm', style: TextStyle(fontSize: 60))),
    );
  }
}