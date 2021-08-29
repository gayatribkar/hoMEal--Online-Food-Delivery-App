import 'package:flutter/material.dart';

import '../models/meal_defenation.dart';

class MealData with ChangeNotifier {
  List<Meal> _items = [
    Meal(
      sellerName: 'Martha',
      id: '001',
      categories: [
        'breakfast',
      ],
      title: 'Idli',
      imageUrl:
          'https://resize.indiatvnews.com/en/resize/newbucket/715_-/2019/03/breakfast-1553786111.jpg',
      discription: [
        'Idli are a type of savoury rice cake, originating from the Indian subcontinent',
        'popular as breakfast foods in Southern India and in Sri Lanka.',
        '1 bowl chatni, 1 bowl sambhar and 4 pieces of Idli',
      ],
      time: 38,
      diliveryType: true,
      price: 40,
      isVeg: true,
      ratings: 4.4,
      isCart: false,
    ),
    Meal(
      sellerName: 'Sanskruti',
      id: '002',
      categories: [
        'breakfast',
      ],
      title: 'Poha',
      imageUrl:
          'https://smedia2.intoday.in/aajtak/images/stories/112015/poha-pakwangali_520_112615053233.jpg',
      discription: [
        'Across India, chivda as poha is a breakfast staple.',
        'The recipe uses chopped onion and chillies, mustard seeds, pomegranate, coriander, and jeeravan masala — the mix of spices that is said to give the Indori poha its distinctive taste.',
        'Dishes of flattened rice — poha — are, however, ubiquitous in states across India.',
      ],
      time: 38,
      diliveryType: false,
      price: 40,
      isVeg: true,
      ratings: 4.6,
    ),
    Meal(
      sellerName: 'Abhinav',
      id: '003',
      categories: [
        'snacks',
        'Continental',
      ],
      title: 'Mayonnaise Sandwich',
      imageUrl:
          'https://www.whiskaffair.com/wp-content/uploads/2020/03/mayonnaise-Sandwich-1.jpg',
      discription: [
        'A sandwich is a food typically consisting of vegetables, sliced cheese or meat, placed on or between slices of bread, or more generally any dish wherein bread serves as a container or wrapper for another food type.',
        'The sandwich is named after its supposed inventor, John Montagu, 4th Earl of Sandwich.',
      ],
      time: 25,
      diliveryType: true,
      price: 110,
      isVeg: true,
      ratings: 4.0,
    ),
    Meal(
      sellerName: 'Martha',
      id: '004',
      categories: ['deserts'],
      title: 'Gulab Jamun',
      imageUrl:
          'https://www.awesomecuisine.com/wp-content/uploads/2007/10/gulab-jamun.jpg',
      discription: [
        'Juicy sweet fried balls dipped in a cardamom-flavored sugar syrup.',
        'A little bit of heaven that dissolves in your mouth.',
      ],
      time: 40,
      diliveryType: false,
      price: 50.00,
      isVeg: true,
    ),
    Meal(
      sellerName: 'l',
      id: '005',
      categories: ['breakfast', 'snacks'],
      title: 'Misal Pav',
      imageUrl:
          'https://pipingpotcurry.com/wp-content/uploads/2018/06/Misal-Pav-Pressure-Cooker.jpg',
      discription: [
        'Misal pav (Marathi: मिसळपाव) is a popular dish from Nashik, India.',
        'It consists of misal (a spicy curry usually made from moth beans) and pav (a type of Indian bread roll).',
        'The final dish is topped with farsan or sev, onions, lemon and coriander (cilantro).',
        'Contains 2 Pav and a bowl of misal',
      ],
      time: 38,
      diliveryType: true,
      price: 50,
      isVeg: true,
      ratings: 5.0,
    ),
    Meal(
      sellerName: 'Abhinav',
      id: '006',
      categories: ['deserts'],
      title: 'Kulfi',
      imageUrl: 'https://kfoods.com/images1/newrecipeicon/kulfi_5813.jpg',
      discription: [
        'Kulfi is similar to ice cream in appearance but is denser and creamier.',
        'It is most similar to frozen custard desserts in North America and comes in a variety of flavors—but the most popular and traditional ones are pistachio, vanilla, mango, rose, cardamom, and saffron.',
        'Contains 2 kulfis.',
      ],
      time: 60,
      diliveryType: false,
      price: 30,
      isVeg: true,
    ),
    Meal(
      sellerName: 'Surinder',
      id: '007',
      categories: [
        'deserts',
      ],
      title: 'Black Forest Cake',
      imageUrl: 'https://ampmstore.in/wp-content/uploads/2018/09/3Z7A1455.jpg',
      discription: [
        'A classic pound cake is made with a pound each of butter, sugar, eggs, and flour.',
        'Baking powder is in many butter cakes, such as Victoria sponge.',
        'The ingredients are sometimes mixed without creaming the butter, using recipes for simple and quick cakes.',
      ],
      time: 60,
      diliveryType: true,
      price: 350,
      isVeg: true,
    ),
    Meal(
      sellerName: 'Surinder',
      id: '008',
      categories: ['lunch'],
      title: 'Paneer Butter Masala',
      imageUrl:
          'https://i2.wp.com/www.vegrecipesofindia.com/wp-content/uploads/2020/01/paneer-butter-masala-1.jpg',
      discription: [
        'Also known as butter paneer, it is a rich & creamy curry made with paneer, spices, onions, tomatoes, cashews and butter.',
        'It is one of the most popular dishes in Indian restaurants similar to kadai paneer, palak paneer, matar paneer and malai kofta.',
      ],
      time: 42,
      diliveryType: true,
      price: 140,
      isVeg: true,
    ),
    Meal(
      sellerName: 'Rehan',
      id: '009',
      categories: ['snacks'],
      title: 'Bhel',
      imageUrl:
          'https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_508,h_320,c_fill/u0tntjsk3kwwjsnm0ogs',
      discription: [
        'Bhelpuri is a savoury snack originating from India, and is also a type of chaat.',
        'It is made of puffed rice, vegetables and a tangy tamarind sauce, and has a crunchy texture.',
        'Bhel is often identified as a \beach snack\', synonymous with the beaches of Mumbai, such as Chowpatty or Juhu.',
      ],
      time: 30,
      diliveryType: false,
      price: 40,
      isVeg: true,
    ),
    Meal(
      sellerName: 'Rehan',
      id: '010',
      categories: ['Continental'],
      title: 'Creamy Tomato Pasta',
      imageUrl:
          'https://www.budgetbytes.com/wp-content/uploads/2013/07/Creamy-Tomato-Spinach-Pasta-V2-bowl.webp',
      discription: [
        'Pasta is a type of food typically made from an unleavened dough of wheat flour mixed with water or eggs, and formed into sheets or other shapes, then cooked by boiling or baking.',
      ],
      time: 40,
      diliveryType: true,
      price: 180,
      isVeg: true,
    ),
    Meal(
      sellerName: 'Archana',
      id: '011',
      categories: ['snacks'],
      title: 'Khandvi / Suralichi Vadi',
      imageUrl:
          'https://www.hungryforever.com/wp-content/uploads/2016/04/feature-image-khandvi.jpg',
      discription: [
        'Khandvi also known as Patuli, Dahivadi or Suralichi Vadi , is a savory snack in Maharashtrian cuisine as well as in Gujarati cuisine of India.',
        'It consists of yellowish, tightly rolled bite-sized pieces and is primarily made of gram flour and yogurt.',
      ],
      time: 40,
      diliveryType: false,
      price: 180,
      isVeg: true,
      ratings: 4.7,
    ),
    Meal(
      sellerName: 'Archana',
      id: '012',
      categories: ['snacks'],
      title: 'Dhokla',
      imageUrl:
          'https://i2.wp.com/www.simpleglutenfreekitchen.com/wp-content/uploads/2017/06/Khaman-dhokla-1.jpg?w=800&ssl=1',
      discription: [
        'Dhokla is a savoury cake made out of Bengal gram flour and is steamed to get a fluffy texture.',
        'The dish occupies pride of place in its state of origin — Gujarat, and has become a favourite across the country.',
        'It\'s a low-calorie, healthy and protein-packed snack.',
      ],
      time: 30,
      diliveryType: true,
      price: 40,
      isVeg: true,
      ratings: 4.5,
    ),
    Meal(
      sellerName: 'Martha',
      id: '013',
      categories: [
        'lunch',
      ],
      title: 'Chicken Dum Biryani',
      imageUrl:
          'https://5.imimg.com/data5/TW/AE/MY-54539941/chicken-dum-biryani-500x500.png',
      discription: [
        'Chicken Biryani is a savory chicken and rice dish that includes layers of chicken, rice, and aromatics that are steamed together.',
        'The bottom layer of rice absorbs all the chicken juices as it cooks, giving it a tender texture and rich flavor, while the top layer of rice turns out white and fluffy.',
      ],
      time: 50,
      diliveryType: false,
      price: 220,
      isVeg: false,
      ratings: 4.6,
    ),
    Meal(
      sellerName: 'Krishnai',
      id: '014',
      categories: ['combos'],
      title: 'Lunch Combo',
      imageUrl:
          'https://b.zmtcdn.com/data/pictures/chains/8/19209538/b3969fe776b7fc3af61790ac588697a3.jpg?output-format=webp&fit=around|1029:555&crop=1029:555;*,*',
      discription: [
        'A combination meal, often referred as a combo-meal, is a type of meal that typically includes food items and a beverage.',
        'They are a common menu item at fast food restaurants, and other restaurants also purvey them.',
      ],
      time: 35,
      diliveryType: true,
      price: 100,
      isVeg: true,
      ratings: 4.1,
    ),
    Meal(
      sellerName: 'Krishnai',
      id: '015',
      categories: ['combos'],
      title: 'Dosa Combo',
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/55faf8bce4b01d789a03827e/1446047095673-71UHDO6Z8LX0K9UFLSKU/ke17ZwdGBToddI8pDm48kNjMXztcaL3Q-7oH9MJVlO1Zw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZamWLI2zvYWH8K3-s_4yszcp2ryTI0HqTOaaUohrI8PILhHKB00kQDyIAm8Src99p5QhR4lft2Y6K0p5QUq1jno/lunch+box?format=1500w',
      discription: [
        'DOSA THALI OR DOSA COMBO MEALS. Idli, Vada, Papad, Sambar, Rice, Dahi, Sweet, Masala Dosa & Water bottle.',
      ],
      time: 48,
      diliveryType: false,
      price: 120,
      isVeg: true,
      ratings: 4.6,
    ),
    Meal(
      sellerName: 'Rehan',
      id: '016',
      categories: ['combos'],
      title: 'Non-Veg Combo',
      imageUrl:
          'https://sotiffin.com/wp-content/uploads/2020/01/nonvegset-768x373.jpeg',
      discription: [
        'Butter Chicken',
        'Chicken Masala',
        'Goat Curry',
        'Dal Makham',
        'Mixed Vegtables',
        '6 Chapaties',
        'Jerra Rice Box',
        'Paula Rice Box',
      ],
      time: 50,
      diliveryType: true,
      price: 600,
      isVeg: false,
      ratings: 3.7,
    ),
  ];

  List<Meal> getItems(bool isVegData) {
    return _items
        .where((element) =>
            isVegData ? element.isVeg == isVegData : (element.ratings > 0))
        .toList();
  }

  List<Meal> mostPopularMeal(bool isVegData) {
    return _items
        .where((element) => element.ratings > 4.5 && isVegData
            ? element.isVeg == isVegData
            : (element.ratings > 4.5))
        .toList();
  }

  List<Meal> applyFilters(Map<String, bool> _filters) {
    return _items.where((element) {
      if (_filters['vegetarian'] && !element.isVeg) {
        return false;
      }
      // notifyListeners();
      return true;
    }).toList();
  }

  void changeFav(String currentId) {
    _items.firstWhere((element) => element.id == currentId).isFav =
        !_items.firstWhere((element) => element.id == currentId).isFav;
    notifyListeners();
  }

  void addToCart(String currentId) {
    var currentMeal = _items.firstWhere((element) => element.id == currentId);
    currentMeal.isCart = !currentMeal.isCart;
    notifyListeners();
  }

  List<Meal> get favMeals {
    return _items.where((element) => element.isFav).toList();
  }

  List<Meal> getCartMeal() {
    return _items.where((element) => element.isCart).toList();
  }

  void incrementCounter(String id) {
    var currentMEal = _items.firstWhere((element) => element.id == id);
    currentMEal.counter++;
    notifyListeners();
  }

  void decrementCounter(String id) {
    var currentMEal = _items.firstWhere((element) => element.id == id);
    currentMEal.counter--;
    notifyListeners();
  }

  void deleteItem(String id) {
    var currentMEal = _items.firstWhere((element) => element.id == id);
    currentMEal.isCart = !currentMEal.isCart;
    notifyListeners();
  }

  double setPrice(String id) {
    var currentMEal = _items.firstWhere((element) => element.id == id);
    var price = currentMEal.price * (currentMEal.counter + 1);
    return price;
  }

  double totalPrice(List<Meal> cartMealsData) {
    double temp = 0;
    for (var i = 0; i < cartMealsData.length; i++) {
      var currentMeal =
          _items.firstWhere((element) => element.id == cartMealsData[i].id);
      temp = temp + currentMeal.price * (currentMeal.counter + 1);
    }
    // notifyListeners();
    return temp;
  }

  void removeAllCartItems(List<Meal> cartMealsData) {
    for (var i = 0; i < cartMealsData.length; i++) {
      var currentMeal =
          _items.firstWhere((element) => element.id == cartMealsData[i].id);
      currentMeal.isCart = !currentMeal.isCart;
    }
    notifyListeners();
  }

  int getSingleCounter(String givenId) {
    return _items.firstWhere((element) => element.id == givenId).counter + 1;
  }

  void resetCounters(List<Meal> cartMealsData) {
    for (var i = 0; i < cartMealsData.length; i++) {
      var currentMeal =
          _items.firstWhere((element) => element.id == cartMealsData[i].id);
      currentMeal.counter = 0;
    }
    notifyListeners();
  }

  Meal getSingleCartMeal() {
    return _items.firstWhere((element) => element.isCart);
  }

  int getCartMealLength() {
    var cartLength = 0;
    for (var i = 0; i < _items.length; i++) {
      _items[i].isCart ? cartLength++ : cartLength += 0;
    }
    return cartLength;
  }
}
