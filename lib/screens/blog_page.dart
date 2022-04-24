import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          leading: Icon(Icons.article),
          title: Text('Blog Page',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        body: Center(child: Text('Blog', style: TextStyle(fontSize: 60))),
      );
}
