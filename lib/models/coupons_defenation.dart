import 'package:flutter/foundation.dart';

class CouponsDefenation {
  final int offerPrercentage;
  final double mimPrice;
  final String date;
  final String code;

  CouponsDefenation({
    @required this.code,
    @required this.date,
    @required this.mimPrice,
    @required this.offerPrercentage,
  });
}
