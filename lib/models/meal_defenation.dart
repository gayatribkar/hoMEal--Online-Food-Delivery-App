import 'package:flutter/foundation.dart';

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String sellerName;
  final String imageUrl;
  final List<String> discription;
  final int time;
  final bool diliveryType;
  final double price;
  final String offers;
  final bool isVeg;
  final double ratings;
  bool isFav;
  bool isCart;
  int counter;

  Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.discription,
    @required this.time,
    @required this.diliveryType,
    @required this.price,
    @required this.sellerName,
    this.offers,
    @required this.isVeg,
    this.ratings = 4.9,
    this.isFav = false,
    this.isCart = false,
    this.counter = 0,
  });
}
