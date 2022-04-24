import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //collection reference
  final CollectionReference itemCollection =
      FirebaseFirestore.instance.collection('items');

  //update user data
  //Future updateUserData(String items, String name, int date) as;
}
