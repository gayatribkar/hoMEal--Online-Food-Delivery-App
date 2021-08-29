import 'package:flutter/material.dart';

import '../models/partyOrderMenu_defination.dart';
import '../models/partyOrders_defination.dart';

class PartyOrderData with ChangeNotifier {
  List<PartyOrder> _items = [
    PartyOrder(
      id: '001',
      categories: ['PartyOrder'],
      sellerName: 'Shwetas kitchen',
      sellerFullName: 'Shweta Jagtap',
      iconImage:
          'https://pbs.twimg.com/profile_images/1111828688977354752/f-_BKDw3.jpg',
      menu: [
        PartyOrderMenuDef(
          id: '01',
          price: 180,
          title: 'Noodles',
        ),
        PartyOrderMenuDef(
          id: '02',
          price: 120,
          title: 'Manchurian',
        ),
        PartyOrderMenuDef(
          id: '03',
          price: 200,
          title: 'shezwan rice',
        ),
        PartyOrderMenuDef(
          id: '04',
          price: 190,
          title: 'Paneer Manchurian',
        ),
        PartyOrderMenuDef(
          id: '05',
          price: 150,
          title: 'Chilly Paneer ',
        ),
        PartyOrderMenuDef(
          id: '06',
          price: 160,
          title: 'Spring Rolls',
        ),
        PartyOrderMenuDef(
          id: '07',
          price: 200,
          title: 'Veg Fried Rice',
        ),
      ],
      time: 60,
      ratings: 3.5,
    ),
    PartyOrder(
      id: '002',
      categories: ['PartyOrder'],
      sellerName: 'Berrys kitchen',
      sellerFullName: 'Berry Shah',
      iconImage:
          'https://i.pinimg.com/originals/9f/2b/cd/9f2bcd0601a2f768775a3b8ec03a9dd7.jpg',
      menu: [
        PartyOrderMenuDef(
          id: '01',
          price: 180,
          title: 'Noodles',
        ),
        PartyOrderMenuDef(
          id: '02',
          price: 120,
          title: 'Manchurian',
        ),
        PartyOrderMenuDef(
          id: '03',
          price: 200,
          title: 'shezwan rice',
        ),
        PartyOrderMenuDef(
          id: '04',
          price: 190,
          title: 'Paneer Manchurian',
        ),
        PartyOrderMenuDef(
          id: '05',
          price: 150,
          title: 'Chilly Paneer ',
        ),
        PartyOrderMenuDef(
          id: '06',
          price: 160,
          title: 'Spring Rolls',
        ),
        PartyOrderMenuDef(
          id: '07',
          price: 200,
          title: 'Veg Fried Rice',
        ),
      ],
      time: 60,
      ratings: 2.5,
    ),
    PartyOrder(
      id: '003',
      categories: ['PartyOrder'],
      sellerName: 'Berhtas kitchen',
      sellerFullName: 'Berhtas Mathews',
      iconImage:
          "https://4fi2fy3hz0lp1pco501bgin0-wpengine.netdna-ssl.com/wp-content/uploads/2018/08/Berthas-Kitchen.png",
      menu: [
        PartyOrderMenuDef(
          id: '01',
          price: 180,
          title: 'Noodles',
        ),
        PartyOrderMenuDef(
          id: '02',
          price: 120,
          title: 'Manchurian',
        ),
        PartyOrderMenuDef(
          id: '03',
          price: 200,
          title: 'shezwan rice',
        ),
        PartyOrderMenuDef(
          id: '04',
          price: 190,
          title: 'Paneer Manchurian',
        ),
        PartyOrderMenuDef(
          id: '05',
          price: 150,
          title: 'Chilly Paneer ',
        ),
        PartyOrderMenuDef(
          id: '06',
          price: 160,
          title: 'Spring Rolls',
        ),
        PartyOrderMenuDef(
          id: '07',
          price: 200,
          title: 'Veg Fried Rice',
        ),
      ],
      time: 60,
      ratings: 4.6,
    ),
    PartyOrder(
      id: '004',
      categories: ['PartyOrder'],
      sellerName: 'Payals Kitchen',
      sellerFullName: 'Payal Arora',
      iconImage:
          'https://i.pinimg.com/236x/8b/ca/12/8bca12c62b17fab535e95c0d11fad31c.jpg',
      menu: [
        PartyOrderMenuDef(
          id: '01',
          price: 180,
          title: 'Noodles',
        ),
        PartyOrderMenuDef(
          id: '02',
          price: 120,
          title: 'Manchurian',
        ),
        PartyOrderMenuDef(
          id: '03',
          price: 200,
          title: 'shezwan rice',
        ),
        PartyOrderMenuDef(
          id: '04',
          price: 190,
          title: 'Paneer Manchurian',
        ),
        PartyOrderMenuDef(
          id: '05',
          price: 150,
          title: 'Chilly Paneer ',
        ),
        PartyOrderMenuDef(
          id: '06',
          price: 160,
          title: 'Spring Rolls',
        ),
        PartyOrderMenuDef(
          id: '07',
          price: 200,
          title: 'Veg Fried Rice',
        ),
      ],
      time: 60,
      ratings: 4.8,
    ),
    PartyOrder(
      id: '005',
      categories: ['PartyOrder'],
      sellerName: 'Mamtas kitchen',
      sellerFullName: 'Mamta Kulkarni',
      iconImage:
          'https://pbs.twimg.com/profile_images/512970664/Logo_MK_for_Whittakers_square.jpg',
      menu: [
        PartyOrderMenuDef(
          id: '01',
          price: 180,
          title: 'Noodles',
        ),
        PartyOrderMenuDef(
          id: '02',
          price: 120,
          title: 'Manchurian',
        ),
        PartyOrderMenuDef(
          id: '03',
          price: 200,
          title: 'shezwan rice',
        ),
        PartyOrderMenuDef(
          id: '04',
          price: 190,
          title: 'Paneer Manchurian',
        ),
        PartyOrderMenuDef(
          id: '05',
          price: 150,
          title: 'Chilly Paneer ',
        ),
        PartyOrderMenuDef(
          id: '06',
          price: 160,
          title: 'Spring Rolls',
        ),
        PartyOrderMenuDef(
          id: '07',
          price: 200,
          title: 'Veg Fried Rice',
        ),
      ],
      time: 60,
      ratings: 3.0,
    ),
    PartyOrder(
      id: '006',
      categories: ['TiffinOrder'],
      sellerName: 'Mamtas kitchen',
      sellerFullName: 'Mamta Kulkarni',
      iconImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4z-9lXvkqLAsaQFStdvB_-SGJcG_O0y3sRg&usqp=CAU',
      menu: [
        PartyOrderMenuDef(
          id: '01',
          price: 180,
          title: 'Noodles',
        ),
        PartyOrderMenuDef(
          id: '02',
          price: 120,
          title: 'Manchurian',
        ),
        PartyOrderMenuDef(
          id: '03',
          price: 200,
          title: 'shezwan rice',
        ),
        PartyOrderMenuDef(
          id: '04',
          price: 190,
          title: 'Paneer Manchurian',
        ),
        PartyOrderMenuDef(
          id: '05',
          price: 150,
          title: 'Chilly Paneer ',
        ),
        PartyOrderMenuDef(
          id: '06',
          price: 160,
          title: 'Spring Rolls',
        ),
        PartyOrderMenuDef(
          id: '07',
          price: 200,
          title: 'Veg Fried Rice',
        ),
      ],
      time: 60,
      ratings: 4.6,
    ),
    PartyOrder(
      id: '007',
      categories: ['TiffinOrder'],
      sellerName: 'Aryas kitchen',
      sellerFullName: 'Arya Deshpande',
      iconImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqteo3XVqdL-9kPffLfh3GtFa0Aok6L2IYYQ&usqp=CAU',
      menu: [
        PartyOrderMenuDef(
          id: '01',
          price: 180,
          title: 'Noodles',
        ),
        PartyOrderMenuDef(
          id: '02',
          price: 120,
          title: 'Manchurian',
        ),
        PartyOrderMenuDef(
          id: '03',
          price: 200,
          title: 'shezwan rice',
        ),
        PartyOrderMenuDef(
          id: '04',
          price: 190,
          title: 'Paneer Manchurian',
        ),
        PartyOrderMenuDef(
          id: '05',
          price: 150,
          title: 'Chilly Paneer ',
        ),
        PartyOrderMenuDef(
          id: '06',
          price: 160,
          title: 'Spring Rolls',
        ),
        PartyOrderMenuDef(
          id: '07',
          price: 200,
          title: 'Veg Fried Rice',
        ),
      ],
      time: 60,
      ratings: 4.7,
    ),
    PartyOrder(
      id: '008',
      categories: ['TiffinOrder'],
      sellerName: 'Anaghas kitchen',
      sellerFullName: 'Anaghas Shimpi ',
      iconImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7IHNCtBwy8XJlWAPksw1FlypYHjSKd3MtZA&usqp=CAU',
      menu: [
        PartyOrderMenuDef(
          id: '01',
          price: 180,
          title: 'Noodles',
        ),
        PartyOrderMenuDef(
          id: '02',
          price: 120,
          title: 'Manchurian',
        ),
        PartyOrderMenuDef(
          id: '03',
          price: 200,
          title: 'shezwan rice',
        ),
        PartyOrderMenuDef(
          id: '04',
          price: 190,
          title: 'Paneer Manchurian',
        ),
        PartyOrderMenuDef(
          id: '05',
          price: 150,
          title: 'Chilly Paneer ',
        ),
        PartyOrderMenuDef(
          id: '06',
          price: 160,
          title: 'Spring Rolls',
        ),
        PartyOrderMenuDef(
          id: '07',
          price: 200,
          title: 'Veg Fried Rice',
        ),
      ],
      time: 60,
      ratings: 3.0,
    ),
    PartyOrder(
      id: '009',
      categories: ['TiffinOrder'],
      sellerName: 'Radhikas kitchen',
      sellerFullName: 'Radhika Arora',
      iconImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQX8L6dPdbdKBOX2G6D0rFmfQrk9Mt2EzD7A&usqp=CAU',
      menu: [
        PartyOrderMenuDef(
          id: '01',
          price: 180,
          title: 'Noodles',
        ),
        PartyOrderMenuDef(
          id: '02',
          price: 120,
          title: 'Manchurian',
        ),
        PartyOrderMenuDef(
          id: '03',
          price: 200,
          title: 'shezwan rice',
        ),
        PartyOrderMenuDef(
          id: '04',
          price: 190,
          title: 'Paneer Manchurian',
        ),
        PartyOrderMenuDef(
          id: '05',
          price: 150,
          title: 'Chilly Paneer ',
        ),
        PartyOrderMenuDef(
          id: '06',
          price: 160,
          title: 'Spring Rolls',
        ),
        PartyOrderMenuDef(
          id: '07',
          price: 200,
          title: 'Veg Fried Rice',
        ),
      ],
      time: 60,
      ratings: 3.0,
    ),
    PartyOrder(
      id: '0010',
      categories: ['TiffinOrder'],
      sellerName: 'Vermas kitchen',
      sellerFullName: 'Dishika Verma',
      iconImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOh5V6jKfYiiwfT7xgR6eH3kTtF76cR8kvpA&usqp=CAU',
      menu: [
        PartyOrderMenuDef(
          id: '01',
          price: 180,
          title: 'Noodles',
        ),
        PartyOrderMenuDef(
          id: '02',
          price: 120,
          title: 'Manchurian',
        ),
        PartyOrderMenuDef(
          id: '03',
          price: 200,
          title: 'shezwan rice',
        ),
        PartyOrderMenuDef(
          id: '04',
          price: 190,
          title: 'Paneer Manchurian',
        ),
        PartyOrderMenuDef(
          id: '05',
          price: 150,
          title: 'Chilly Paneer ',
        ),
        PartyOrderMenuDef(
          id: '06',
          price: 160,
          title: 'Spring Rolls',
        ),
        PartyOrderMenuDef(
          id: '07',
          price: 200,
          title: 'Veg Fried Rice',
        ),
      ],
      time: 60,
      ratings: 5.0,
    ),
    PartyOrder(
      id: '0011',
      categories: ['TiffinOrder'],
      sellerName: 'Bansals kitchen',
      sellerFullName: 'Ankita Bansal',
      iconImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlWcZZlAbJnBJGDyBgKWJYeF6SihQyW8riJA&usqp=CAU',
      menu: [
        PartyOrderMenuDef(
          id: '01',
          price: 180,
          title: 'Noodles',
        ),
        PartyOrderMenuDef(
          id: '02',
          price: 120,
          title: 'Manchurian',
        ),
        PartyOrderMenuDef(
          id: '03',
          price: 200,
          title: 'shezwan rice',
        ),
        PartyOrderMenuDef(
          id: '04',
          price: 190,
          title: 'Paneer Manchurian',
        ),
        PartyOrderMenuDef(
          id: '05',
          price: 150,
          title: 'Chilly Paneer ',
        ),
        PartyOrderMenuDef(
          id: '06',
          price: 160,
          title: 'Spring Rolls',
        ),
        PartyOrderMenuDef(
          id: '07',
          price: 200,
          title: 'Veg Fried Rice',
        ),
      ],
      time: 60,
      ratings: 3.0,
    ),
  ];

  void changeFav(String currentId) {
    _items.firstWhere((element) => element.id == currentId).isFav =
        !_items.firstWhere((element) => element.id == currentId).isFav;
    notifyListeners();
  }

  List<PartyOrder> get item {
    return [..._items];
  }

  // void removeAllCartItems(List<PartyOrder> cartMealsData) {
  //   for (var i = 0; i < cartMealsData.length; i++) {
  //     var currentMeal =
  //         _items.firstWhere((element) => element.id == cartMealsData[i].id);
  //     currentMeal.isCart = !currentMeal.isCart;
  //   }
  //   notifyListeners();
  // }

  PartyOrder chooseByIndex(String id) {
    var currentMeal = _items.firstWhere((element) => element.id == id);
    return currentMeal;
  }

  int getSingleCounter(String givenId, String menuId) {
    return _items
            .firstWhere((element) => element.id == givenId)
            .menu
            .firstWhere((element) => element.id == menuId)
            .quantity +
        1;
  }

  List<PartyOrder> mostPopularMeal() {
    return _items.where((element) => element.ratings > 4.5).toList();
  }

  List<PartyOrder> get favMeals {
    return _items.where((element) => element.isFav).toList();
  }

  void changedClick(PartyOrderMenuDef currentMenu) {
    currentMenu.isClicked = !currentMenu.isClicked;
    notifyListeners();
  }

  void incrementPartyMeal(String id, String menuId) {
    var quantity = _items
        .firstWhere((element) => element.id == id)
        .menu
        .firstWhere((element) => element.id == menuId);
    quantity.quantity++;
    notifyListeners();
  }

  void decrementPartyMeal(String id, String menuId) {
    var quantity = _items
        .firstWhere((element) => element.id == id)
        .menu
        .firstWhere((element) => element.id == menuId);
    quantity.quantity--;

    notifyListeners();
  }

  double setPrice(int quantity, double price) {
    return (quantity + 1) * price;
  }

  int totalQuantity(String id) {
    var quant = 0;

    for (var i = 0;
        i < _items.firstWhere((element) => element.id == id).menu.length;
        i++) {
      if (_items.firstWhere((element) => element.id == id).menu[i].isClicked) {
        quant = quant +
            _items.firstWhere((element) => element.id == id).menu[i].quantity +
            1;
      }
    }
    return quant;
  }

  double totalPrice(String id) {
    var quant = 0.0;

    for (var i = 0;
        i < _items.firstWhere((element) => element.id == id).menu.length;
        i++) {
      if (_items.firstWhere((element) => element.id == id).menu[i].isClicked) {
        quant = quant +
            _items.firstWhere((element) => element.id == id).menu[i].price *
                (_items
                        .firstWhere((element) => element.id == id)
                        .menu[i]
                        .quantity +
                    1);
      }
    }
    return quant;
  }

  List<PartyOrderMenuDef> partyMealCart(String id) {
    return _items
        .firstWhere((element) => element.id == id)
        .menu
        .where((element) => element.isClicked)
        .toList();
  }

  List<PartyOrder> getPartyMeal() {
    List<PartyOrder> pmeal = [];
    for (var i = 0; i < _items.length; i++) {
      for (var j = 0; j < _items[i].categories.length; j++) {
        if (_items[i].categories[j] == 'PartyOrder') {
          pmeal.add(_items[i]);
        }
      }
    }
    return pmeal;
  }

  List<PartyOrder> getTiffinMeal() {
    List<PartyOrder> pmeal = [];
    for (var i = 0; i < _items.length; i++) {
      for (var j = 0; j < _items[i].categories.length; j++) {
        if (_items[i].categories[j] == 'TiffinOrder') {
          pmeal.add(_items[i]);
        }
      }
    }
    return pmeal;
  }
}
