import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/partyOrders_defination.dart';
import './partysub_page.dart';
import '../../provider/partyOrders_data.dart';

class PartyPageDesign extends StatefulWidget {
  static const routeName = '/Party-Orders';
  final List<PartyOrder> categoryPartyMeals;
  PartyPageDesign(this.categoryPartyMeals);

  @override
  _PartyPageDesignState createState() => _PartyPageDesignState();
}

class _PartyPageDesignState extends State<PartyPageDesign> {
  @override
  Widget build(BuildContext context) {
    final String title = ModalRoute.of(context).settings.arguments;
    final partyOrderData = Provider.of<PartyOrderData>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: widget.categoryPartyMeals.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 10,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        PartySubPage(widget.categoryPartyMeals[index].id),
                  ),
                );
              },
              child: Container(
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.red),
                // ),
                margin: EdgeInsets.only(
                  bottom: 10,
                  top: 10,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 125,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                              widget.categoryPartyMeals[index].iconImage),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            // height: SizeConfig.blockSizeVertical * 20,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              widget.categoryPartyMeals[index].sellerName,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 28),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.black,
                                  semanticLabel: widget
                                      .categoryPartyMeals[index].ratings
                                      .toString(),
                                  size: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 3),
                                  child: Text(
                                    widget.categoryPartyMeals[index].ratings
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.timer,
                                    color: Colors.black,
                                    semanticLabel: widget
                                            .categoryPartyMeals[index].time
                                            .toString() +
                                        ' mins',
                                    size: 10,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 3),
                                  child: Text(
                                    widget.categoryPartyMeals[index].time
                                            .toString() +
                                        ' mins',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                // Container(
                                //   margin: EdgeInsets.only(left: 3),
                                //   child: IconButton(
                                //     onPressed: () {
                                //       partyOrderData.changeFav(
                                //           widget.categoryPartyMeals[index].id);
                                //     },
                                //     icon: widget.categoryPartyMeals[index].isFav
                                //         ? Icon(
                                //             Icons.favorite,
                                //             size: 25,
                                //           )
                                //         : Icon(
                                //             Icons.favorite_border_rounded,
                                //             size: 25,
                                //           ),
                                //     color: Colors.red,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
