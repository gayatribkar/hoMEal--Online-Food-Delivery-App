import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kf_drawer/kf_drawer.dart';

import '../widgets/order_history_widget.dart';
import '../provider/order_history_data.dart';
import '../provider/partyOrder_history_data.dart';

// ignore: must_be_immutable
class OrderHistory extends KFDrawerContent {
  static const routename = "/orderHistory-page";

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    final orderHistoryProvider = Provider.of<OrderHistoryData>(context);
    final orderedData = orderHistoryProvider.item;
    final partyorderHistoryProvider =
        Provider.of<PartyOrderHistoryData>(context);
    final partyorderedData = partyorderHistoryProvider.item;
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
                    'Order History',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            orderedData.isEmpty && partyorderedData.isEmpty
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 125, bottom: 50),
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image:
                                  AssetImage('images/empty_order_history.gif'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'No Orders yet :(',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: OrderHistoryWidget(),
                  ),
          ],
        ),
      ),
    );
  }
}
