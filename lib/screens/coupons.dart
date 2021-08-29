import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

import '../widgets/coupons_widget.dart';

// ignore: must_be_immutable
class EnterPromoCode extends KFDrawerContent {
  static const routename = "/promoCode-page";

  EnterPromoCode({
    Key key,
  });

  @override
  _EnterPromoCodeState createState() => _EnterPromoCodeState();
}

class _EnterPromoCodeState extends State<EnterPromoCode> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
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
                    'Coupons',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: CouponsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
