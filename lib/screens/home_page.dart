import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_um_try1/screens/blog_page.dart';
import 'package:food_um_try1/screens/donation_page.dart';
import 'package:food_um_try1/screens/item_page.dart';
import 'package:food_um_try1/screens/model/user_model.dart';
import 'package:food_um_try1/screens/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // User? user = FirebaseAuth.instance.currentUser;
  // UserModel loggedInUser = UserModel();

  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(user!.uid)
  //       .get()
  //       .then((value){
  //         this.loggedInUser = UserModel.fromMap(value.data());
  //         setState(() {});
  //       });
  // }




  int currentIndex = 0;
  final screens = [ItemPage(), DonationPage(), BlogPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 25,
          selectedFontSize: 20,
          unselectedFontSize: 17,
          showUnselectedLabels: true,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              label: 'Item',
              backgroundColor: Color.fromARGB(255, 238, 127, 0),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Donation',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Blog',
              backgroundColor: Color.fromARGB(255, 238, 127, 0),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.green,
            ),
          ],
        ),
      );
}
