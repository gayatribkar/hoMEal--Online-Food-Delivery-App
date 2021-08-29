import 'package:flutter/foundation.dart';

class PartyOrderMenuDef {
  final String title;
  final String id;
  final double price;
  int quantity;
  bool isClicked;

  PartyOrderMenuDef({
    @required this.title,
    @required this.price,
    @required this.id,
    this.quantity = 0,
    this.isClicked = false,
  });
}
