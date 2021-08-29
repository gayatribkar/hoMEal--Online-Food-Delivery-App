import 'package:flutter/material.dart';

import '../models/partyOrderHistory_def.dart';

class PartyOrderHistoryData with ChangeNotifier {
  List<PartyOrderHistoryDefenation> _items = [];

  List<PartyOrderHistoryDefenation> get item {
    return [..._items];
  }

  void addOrderHistory(PartyOrderHistoryDefenation ohd) {
    _items.add(ohd);
    notifyListeners();
  }
}
