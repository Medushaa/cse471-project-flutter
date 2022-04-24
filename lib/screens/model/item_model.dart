class itemModel {
  String? itemuid;
  String? itemname;
  DateTime? expiry;

  itemModel({this.itemuid, this.itemname, this.expiry});

  // receiving data from server
  factory itemModel.fromMap(map) {
    return itemModel(
      itemuid: map['itemuid'],
      itemname: map['itemname'],
      expiry: map['expiry'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'itemuid': itemuid,
      'itemname': itemname,
      'expiry': expiry,

    };
  }
}