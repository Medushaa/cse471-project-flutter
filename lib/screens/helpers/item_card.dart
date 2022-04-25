import 'package:flutter/material.dart';
import 'package:food_um_try1/screens/model/item_model.dart';
import 'package:intl/intl.dart';

class itemCard extends StatelessWidget {
  final itemModel _item;

  itemCard(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("Item Name: ${_item.itemName}"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Spacer(),
                    Text("Expiry Date: ${DateFormat('MM/dd/yyyy').format(_item.expirydate!).toString()}"),
                  ],
                ),
              ],
            ),
        ),
      ),
    );
  }
}
