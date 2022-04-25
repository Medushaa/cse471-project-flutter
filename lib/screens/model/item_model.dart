class itemModel {
  String? itemName;
  DateTime? expirydate;

  itemModel();

  // sending data to our server
  Map<String, dynamic> toJson() => {
      'itemName': itemName,
      'expirydate': expirydate,
    };

  itemModel.fromSnapshot(snapshot)
      : itemName = snapshot.data()['itemName'],
        expirydate = snapshot.data()['expirydate'].toDate();
}
