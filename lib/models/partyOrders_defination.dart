import 'package:flutter/foundation.dart';

import './partyOrderMenu_defination.dart';

class PartyOrder {
  final String id;
  final String sellerName;
  final String sellerFullName;
  final String iconImage;
  final int time;
  final List<PartyOrderMenuDef> menu;
  final List<String> categories;
  final double ratings;
  bool isFav;
  bool isCart;
  int counter;

  PartyOrder({
    @required this.id,
    @required this.sellerName,
    @required this.sellerFullName,
    @required this.iconImage,
    @required this.time,
    @required this.menu,
    @required this.categories,
    this.ratings = 4.9,
    this.isFav = false,
    this.isCart = false,
    this.counter = 0,
  });
}
