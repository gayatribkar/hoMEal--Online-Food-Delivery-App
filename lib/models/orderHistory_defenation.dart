import 'package:flutter/foundation.dart';
import './meal_defenation.dart';

class OrderHistoryDefenation {
  final String totalPrice;
  final List<Meal> orderedMeals;
  final List<int> counters;
  bool isExpanded;

  OrderHistoryDefenation({
    this.isExpanded = false,
    @required this.totalPrice,
    @required this.counters,
    @required this.orderedMeals,
  });
}
