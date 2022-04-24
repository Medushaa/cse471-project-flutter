import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_um_try1/screens/home_page.dart';
import 'package:food_um_try1/screens/model/item_model.dart';
import 'package:food_um_try1/screens/model/user_model.dart';


class AddItemScreen extends StatefulWidget {
  const AddItemScreen({ Key? key }) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}


class _AddItemScreenState extends State<AddItemScreen> {

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
        .then((value){
          this.loggedInUser = UserModel.fromMap(value.data());
          setState(() {});
        });
  }
  
  //DateTime _selectedDate;

  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final ItemNameEditingController = new TextEditingController();
  final ExpiryDateEditingController = new TextEditingController();
  


  
  @override
  Widget build(BuildContext context){

    //name field
    final ItemNameField = TextFormField(
        autofocus: false,
        controller: ItemNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name (Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          ItemNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Item Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    
    final ExpiryDateField = DateTimeFormField(
      decoration: const InputDecoration(
        hintStyle: TextStyle(color: Colors.black45),
        errorStyle: TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.event_note),
        labelText: 'Expiry Date',
      ),
      mode: DateTimeFieldPickerMode.date,
      autovalidateMode: AutovalidateMode.always,
      validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
      onDateSelected: (DateTime value) {
        print(value);
      },
    );
          

    //button
    final AddItemButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 238, 127, 0),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () { 

          FirebaseFirestore.instance
            .collection('items')
            .add({'itemName': ItemNameEditingController.text, 'expirydate': ExpiryDateEditingController.text, 'uid': loggedInUser.uid});

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
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HomeScreen()));
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
                          "Add Item",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 158, 53),
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 25), //adds a litol space
                    ItemNameField,
                    SizedBox(height: 10), //adds a litol space
                    ExpiryDateField,
                    SizedBox(height: 15),
                    AddItemButton,
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

  // void AddItem(String itemname, String expiry) async {
  //   if (_formKey.currentState!.validate()) {
  //     await _auth
  //         .currentUser
  //         .then((value) => {postDetailsToFirestore()})
  //         .catchError((e) {
  //       Fluttertoast.showToast(msg: e!.message);
  //     });
  //   }
  // }
  
  // postDetailsToFirestore() async {
  //   // calling our firestore
  //   // calling our user model
  //   // sedning these values

  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  //   itemModel ItemModel = itemModel();
  //   // writing all the values
  //   itemModel.itemname = ItemNameEditingController.text;
  //   itemModel.expiry = ExpiryDateEditingController.text;

  //   await firebaseFirestore
  //       .collection("items")
  //       .doc()
  //       .set(itemModel.toMap());
  //   Fluttertoast.showToast(msg: "Item added successfully :) ");

  //   Navigator.pushAndRemoveUntil(
  //       (context),
  //       MaterialPageRoute(builder: (context) => HomeScreen()),
  //       (route) => false);
  // }
}
