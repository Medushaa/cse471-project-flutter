class itemModel {
  //String? itemID;
  String? itemName;
  DateTime? expirydate;

  itemModel();

  // sending data to our server
  Map<String, dynamic> toJson() => {
      'itemName': itemName,
      'expirydate': expirydate,
      //'itemID' : itemID,
    };

  itemModel.fromSnapshot(snapshot)
      : itemName = snapshot.data()['itemName'],
        expirydate = snapshot.data()['expirydate'].toDate();
        //itemID = snapshot.id;
}
