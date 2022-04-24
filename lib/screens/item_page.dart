import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          leading: Icon(Icons.shopping_cart),
          title: Text('Item Page',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        body: Center(child: Text('Item', style: TextStyle(fontSize: 60))),
      );
}
