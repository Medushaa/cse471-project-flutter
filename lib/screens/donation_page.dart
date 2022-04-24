import 'package:flutter/material.dart';

class DonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color.fromARGB(255, 238, 127, 0),
          leading: Icon(Icons.favorite),
          title: Text('Donation  Bhallage Page',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        body: Center(child: Text('Donation', style: TextStyle(fontSize: 60))),
      );
}
