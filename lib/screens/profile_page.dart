import 'package:flutter/material.dart';
import 'package:food_um_try1/screens/home_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color.fromARGB(255, 238, 127, 0),
          leading: Icon(Icons.person),
          title: Text(
            'Profile',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          actions: [
            Icon(Icons.more_vert),
          ],
        ),
        body: Center(
            child: Text("Profile",
                //"${loggedInUser.name} ${loggedInUser.email}",
                style: TextStyle(fontSize: 60))),
      );
}
