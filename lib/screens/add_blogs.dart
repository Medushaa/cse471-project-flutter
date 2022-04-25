import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_um_try1/screens/home_page.dart';
import 'package:food_um_try1/screens/item_page.dart';
import 'package:food_um_try1/screens/model/item_model.dart';
import 'package:food_um_try1/screens/model/user_model.dart';
import 'package:get/get.dart';

class AddBlogScreen extends StatefulWidget {
  const AddBlogScreen({Key? key}) : super(key: key);

  @override
  State<AddBlogScreen> createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  final _auth = FirebaseAuth.instance;

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

  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final blogTitleEditingController = new TextEditingController();
  final blogBodyEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //name field
    final BlogTitleField = TextFormField(
        autofocus: false,
        controller: blogTitleEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Title cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name (Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          blogTitleEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.article),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Blog Title",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final BlogBodyField = TextFormField(
      minLines: 5,
      maxLines: 7,
        controller: blogBodyEditingController,
        keyboardType: TextInputType.multiline,

        validator: (value) {},
        onSaved: (value) {
          blogBodyEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Blog Body (min. 50 characters)",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ));

    //button
    final AddBlogButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 238, 127, 0),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          FirebaseFirestore.instance.collection('blogs').add({
            'author': loggedInUser.uid,
            'title': blogTitleEditingController.text,
            'blog_body': blogBodyEditingController.text,
            // 'uid': loggedInUser.uid
          });

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
          //AddItem(ItemNameEditingController.text, ExpiryDateEditingController.text);
        },
        child: Text(
          "Confirm",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final goBackButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.white,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: Text(
          "Go Back",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //row keeps adding things in one row
                    //column adds them one under other
                    Row(
                      //FoodUm text.
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Write Blog",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 158, 53),
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 25), //adds a litol space
                    BlogTitleField,
                    SizedBox(height: 10), //adds a litol space
                    BlogBodyField,
                    SizedBox(height: 15),
                    AddBlogButton,
                    SizedBox(height: 25),
                    goBackButton,
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}