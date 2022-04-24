import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_um_try1/screens/model/user_model.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({ Key? key }) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value){
          this.loggedInUser = UserModel.fromMap(value.data());
          setState(() {});
        });
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          toolbarHeight: 70,
          leading: Icon(Icons.article),
          title: Text('Blog Page',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Yblogs',
              ),
            ],
          ),
        ),
        //add item button
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            openDialog();
          }),
          child: const Icon(Icons.add),
        ),
    );
  }
  Future openDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Subscribe to Premium Services to be able to publish Blogs"),
      content: TextField(
        decoration: InputDecoration(hintText: 'Enter Credit card number'),
      ),
      actions: [
        TextButton(
          child: Text("Subscribe"),
          onPressed: () {},
        ),
      ],
    ),
  );
}