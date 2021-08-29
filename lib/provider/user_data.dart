import 'package:flutter/material.dart';

import '../models/userData_defenation.dart';

class UserDataFinal with ChangeNotifier {
  List<UserDataDefenation> _items = [
    UserDataDefenation(
      address: 'Flat No. {int}, {Society Name} {City}-{Pincode}',
      emailId: 'piyush@gmail.com',
      firstName: 'Piyush',
      id: '001',
      lastName: 'Nagpal',
      password: 'piyush',
      phoneNo: 123456781,
    ),
    UserDataDefenation(
      address: 'Flat No. {int}, {Society Name} {City}-{Pincode}',
      emailId: 'shivani@gmail.com',
      firstName: 'Shivani',
      id: '002',
      lastName: 'Bhinge',
      password: 'shivani',
      phoneNo: 123456782,
    ),
    UserDataDefenation(
      address: 'Flat No. {int}, {Society Name} {City}-{Pincode}',
      emailId: 'vedangee@gmail.com',
      firstName: 'Vedangee',
      id: '003',
      lastName: 'Diwate',
      password: 'vedangee',
      phoneNo: 123456783,
    ),
    UserDataDefenation(
      address: 'Flat No. {int}, {Society Name} {City}-{Pincode}',
      emailId: 'gayatri@gmail.com',
      firstName: 'Gayatri',
      id: '004',
      lastName: 'Bhatambarekar',
      password: 'gayatri',
      phoneNo: 123456784,
    ),
  ];

  List<UserDataDefenation> get items {
    return [..._items];
  }

  void addUserData(UserDataDefenation addItem) {
    _items.add(addItem);
    notifyListeners();
  }

  UserDataDefenation getSingleUserData(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void updateEmaPho({String id, int newPhoneNumber, String newEmailId}) {
    var toBeUpdatedItem = _items.firstWhere((element) => element.id == id);
    toBeUpdatedItem.phoneNo = newPhoneNumber;
    toBeUpdatedItem.emailId = newEmailId;
    notifyListeners();
  }

  void updateAddress({String id, String newAddress}) {
    var toBeUpdatedItem = _items.firstWhere((element) => element.id == id);
    toBeUpdatedItem.address = newAddress;
    notifyListeners();
  }
}
