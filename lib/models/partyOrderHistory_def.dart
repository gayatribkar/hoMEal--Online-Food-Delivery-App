import 'package:flutter/foundation.dart';
import './partyOrders_defination.dart';
import '../models/partyOrderMenu_defination.dart';

class PartyOrderHistoryDefenation {
  final String totalPrice;
  final List<PartyOrderMenuDef> orderedPartyMeals;
  final List<int> counters;
  bool isExpanded;

  PartyOrderHistoryDefenation({
    this.isExpanded = false,
    @required this.totalPrice,
    @required this.counters,
    @required this.orderedPartyMeals,
  });
}
