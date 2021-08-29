import 'package:flutter/material.dart';

import '../models/orderHistory_defenation.dart';

class OrderHistoryData with ChangeNotifier {
  List<OrderHistoryDefenation> _items = [];

  List<OrderHistoryDefenation> get item {
    return [..._items];
  }

  void addOrderHistory(OrderHistoryDefenation ohd) {
    _items.add(ohd);
    notifyListeners();
  }
}
