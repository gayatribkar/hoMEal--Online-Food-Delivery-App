import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/partyOrderMenu_defination.dart';
import '../../provider/partyOrders_data.dart';
import '../../provider/coupons_data.dart';

class PartyCart extends StatefulWidget {
  static const routeName = '/Party-Cart';

  @override
  _PartyCartState createState() => _PartyCartState();
}

class _PartyCartState extends State<PartyCart> {
  int percentage = 0;

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

    isCouponTrue == -1
        ? setState(() {
            showSnackBarFinal('Invalid Coupon Code');
            inputtedCouponCode.clear();
          })
        : setState(() {
            percentage = couponsData[isCouponTrue].offerPrercentage;
            showSnackBarFinal('Coupon Code Applied Successfully');
            inputtedCouponCode.clear();
          });
  }

  List<int> getCounters(List<PartyOrderMenuDef> data) {
    return data.map((e) => e.quantity).toList();
  }

  void showSnackBarFinal(String title) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(title),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  final inputtedCouponCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final cartItemData = Provider.of<PartyOrderData>(context);
    final cartItem = cartItemData.partyMealCart(routeArgs['id']);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {},
          )
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.08,
        child: RaisedButton(
          color: Color(0xff00001a),
          child: Text(
            "PROCEED TO PAY",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          onPressed: () {
           
           





           
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.94,
        child: Column(
          children: [
            Container(
              height: cartItem.length < 7
                  ? MediaQuery.of(context).size.height * 0.08 * cartItem.length
                  : MediaQuery.of(context).size.height * 0.56,
              child: ListView.builder(
                itemCount: cartItem.length,
                itemBuilder: (context, index) => Card(
                  elevation: 10,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              cartItem[index].title,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Rs.${cartItem[index].price}',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.do_disturb_on_outlined),
                                onPressed: () {},
                              ),
                              Text(
                                '${cartItem[index].quantity + 1}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add_circle_outline_rounded),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                            applyCoupons();
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            '- Rs. ${((cartItemData.totalPrice(routeArgs['id']) + diliveryCharges()) * (percentage / 100)).toStringAsFixed(1)}',
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            'Rs ${finalPrice(cartItemData.totalPrice(routeArgs['id']), diliveryCharges(), percentage).round()}',
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
          ],
        ),
      ),
    );
  }
}
