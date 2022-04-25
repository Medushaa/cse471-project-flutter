import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_um_try1/screens/add_blogs.dart';
import 'package:food_um_try1/screens/helpers/blog_card.dart';
//import 'package:food_um_try1/screens/helpers/item_card.dart';
import 'package:food_um_try1/screens/model/blog_model.dart';
//import 'package:food_um_try1/screens/model/item_model.dart';
import 'package:food_um_try1/screens/model/user_model.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({ Key? key }) : super(key: key);
  @override
  _BlogPageState createState() => _BlogPageState();
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
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }


  List<Object> _BlogList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getBlogsList(); //*
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: Icon(Icons.article),
        title: Text(
          'Blog Page',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _BlogList.length,
          itemBuilder: (content, index) {
            return blogCard(_BlogList[index] as blogModel); //*
          },
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
          title:
              Text("Subscribe to Premium Services to be able to publish Blogs"),
          content: TextField(
            decoration: InputDecoration(hintText: 'Enter Credit card number'),
          ),
          actions: [
            TextButton(
              child: Text("Subscribe"),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddBlogScreen()));
              },
            ),
          ],
        ),
      );
 Future getBlogsList() async { //*
   final uid = loggedInUser.uid;
    var data = await FirebaseFirestore.instance
        .collection('blogs') //*
        .get();

    setState(() {
      _BlogList = List.from(data.docs.map((doc) => blogModel.fromSnapshot(doc))); //*
    });
  }
}
