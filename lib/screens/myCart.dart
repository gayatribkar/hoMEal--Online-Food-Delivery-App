import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kf_drawer/kf_drawer.dart';

import '../provider/meal_data.dart';
import '../provider/coupons_data.dart';
import '../models/meal_defenation.dart';
import '../models/orderHistory_defenation.dart';

// ignore: must_be_immutable
class MyCart extends KFDrawerContent {
  static const routename = "/cart-page";

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  int percentage = 0
  ;

  void inValidCoupon() {
    showSnackBarFinal('Invalid Coupon Code');
    inputtedCouponCode.clear();
  }

  void validCoupon(int isCouponTrue) {
    percentage = couponsData[isCouponTrue].offerPrercentage;
    showSnackBarFinal('Coupon Code Applied Successfully');
    inputtedCouponCode.clear();
  }

  double finalPrice(double totalAmount, double dilivary, int percentage) {
    return ((totalAmount + dilivary) -
        ((totalAmount + dilivary) * (percentage / 100)));
  }

  double diliveryCharges() {
    return 38;
  }

  void applyCoupons() {
    var isCouponTrue = couponsData.indexWhere((element) {
      return element.code == inputtedCouponCode.text;
    });

    isCouponTrue == -1 ? inValidCoupon() : validCoupon(isCouponTrue);
  }

  List<int> getCounters(List<Meal> data) {
    return data.map((e) => e.counter).toList();
  }

  void showSnackBarFinal(String title) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(title),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  final inputtedCouponCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mealData = Provider.of<MealData>(context);
    final cartMeals = mealData.getCartMeal();

    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'My Cart',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            cartMeals.isEmpty
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: AssetImage('images/empty_cart.gif'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Looks like you haven\'t made your choice yet! :(',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.94,
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: cartMeals.length < 7
                                    ? MediaQuery.of(context).size.height *
                                        0.08 *
                                        cartMeals.length
                                    : MediaQuery.of(context).size.height * 0.56,
                                child: ListView.builder(
                                  itemCount: cartMeals.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      elevation: 10,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                                child: Text(
                                                  cartMeals[index].title,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Rs. ${mealData.setPrice(cartMeals[index].id)}',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01,
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  IconButton(
                                                    icon: Icon(Icons
                                                        .do_disturb_on_outlined),
                                                    onPressed: () {
                                                      cartMeals[index].counter >
                                                              0
                                                          ? mealData
                                                              .decrementCounter(
                                                                  cartMeals[
                                                                          index]
                                                                      .id)
                                                          : mealData.deleteItem(
                                                              cartMeals[index]
                                                                  .id);
                                                    },
                                                  ),
                                                  Text(
                                                    '${mealData.getSingleCounter(cartMeals[index].id)}',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: Icon(Icons
                                                        .add_circle_outline_rounded),
                                                    onPressed: () {
                                                      mealData.incrementCounter(
                                                          cartMeals[index].id);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Card(
                                color: Colors.amberAccent[100],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: 10,
                                        top: 7,
                                      ),
                                      child: TextField(
                                        controller: inputtedCouponCode,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Coupon Code!',
                                          prefixIcon: Icon(
                                            Icons.card_giftcard_rounded,
                                            color: Colors.black,
                                          ),
                                          suffixIcon: FlatButton(
                                            child: Text('Apply!'),
                                            onPressed: () {
                                              setState(() {
                                                applyCoupons();
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                color: Color(0xff00001a).withOpacity(0.8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: 10,
                                        top: 7,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 5,
                                            ),
                                            child: Text(
                                              'Dilivery Charges: ',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              right: 5,
                                            ),
                                            child: Text(
                                              '${diliveryCharges()}',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 5,
                                            ),
                                            child: Text(
                                              'Discounts: ',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              right: 5,
                                            ),
                                            child: Text(
                                              '- Rs. ${((mealData.totalPrice(cartMeals) + diliveryCharges()) * (percentage / 100)).toStringAsFixed(1)}',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 5,
                                            ),
                                            child: Text(
                                              'Total Amount: ',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              right: 5,
                                            ),
                                            child: Text(
                                              'Rs ${finalPrice(mealData.totalPrice(cartMeals), diliveryCharges(), percentage).round()}',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: RaisedButton.icon(
                                  color: Color(0xff00001a),
                                  icon: Icon(
                                    Icons.arrow_right_alt_rounded,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    'Proceed to Pay',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                      '/final-Payment',
                                      arguments: {
                                        'totalPrice': finalPrice(
                                                mealData.totalPrice(cartMeals),
                                                diliveryCharges(),
                                                percentage)
                                            .round(),
                                        'OrderHistoryInfo':
                                            OrderHistoryDefenation(
                                          counters: getCounters(cartMeals),
                                          orderedMeals: cartMeals,
                                          totalPrice: finalPrice(
                                                  mealData
                                                      .totalPrice(cartMeals),
                                                  diliveryCharges(),
                                                  percentage)
                                              .round()
                                              .toString(),
                                        ),
                                        'cartMealsInfo': cartMeals,
                                      },
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class SnackbarButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        final snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Text label'),
          action: SnackBarAction(
            label: 'Action',
            onPressed: () {},
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Text('Show SnackBar'),
    );
  }
}
