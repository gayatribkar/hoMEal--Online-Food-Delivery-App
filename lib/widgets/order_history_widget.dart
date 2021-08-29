import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/order_history_data.dart';
import '../provider/partyOrder_history_data.dart';

class OrderHistoryWidget extends StatefulWidget {
  @override
  _OrderHistoryWidgetState createState() => _OrderHistoryWidgetState();
}

class _OrderHistoryWidgetState extends State<OrderHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    final orderHistoryProvider = Provider.of<OrderHistoryData>(context);
    final orderedData = orderHistoryProvider.item;
    final partyorderHistoryProvider =
        Provider.of<PartyOrderHistoryData>(context);
    final partyorderedData = partyorderHistoryProvider.item;
    return Column(
      children: [
        Text("Meal History"),
        orderedData.isEmpty
            ? Container(child: Text("NO order yet"))
            : Expanded(
                child: ListView.builder(
                  itemCount: orderedData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10,
                      child: ExpansionPanelList(
                        animationDuration: Duration(seconds: 1),
                        children: [
           
                          ExpansionPanel(
                            body: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Divider(
                                    endIndent: 10,
                                    indent: 10,
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                  Text(
                                    'Total Amount: Rs. ${orderedData[index].totalPrice}/-',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.04 *
                                        orderedData[index].orderedMeals.length,
                                    child: ListView.builder(
                                      itemCount: orderedData[index]
                                          .orderedMeals
                                          .length,
                                      itemBuilder: (context, i) {
                                        return Row(
                                          children: [
                                            Text(
                                              '${orderedData[index].orderedMeals[i].title}',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              'Rs ${orderedData[index].orderedMeals[i].price}',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  right: 10, left: 30),
                                              child: Text(
                                                'x ${orderedData[index].counters[i] + 1}',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child: RaisedButton(
                                            child: Text('Rate Order'),
                                            onPressed: () {},
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          margin: EdgeInsets.only(left: 20),
                                          child: RaisedButton(
                                            child: Text('Repeat Order'),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${orderedData[index].orderedMeals[index].sellerName}{Shop Name}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Text(
                                      '{Seller\'s Name}(Location{Area Name})',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            isExpanded: orderedData[index].isExpanded,
                          )
                        ],
                        expansionCallback: (int item, bool status) {
                          setState(() {
                            orderedData[index].isExpanded =
                                !orderedData[index].isExpanded;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
        // Text("Party History"),
        // partyorderedData.isEmpty
        //     ? Container(child: Text("NO order yet"))
        //     : Expanded(
        //         child: ListView.builder(
        //           itemCount: partyorderedData.length,
        //           itemBuilder: (context, index) {
        //             return Card(
        //               elevation: 10,
        //               child: ExpansionPanelList(
        //                 animationDuration: Duration(seconds: 1),
        //                 children: [
        //                   ExpansionPanel(
        //                     body: Container(
        //                       padding: EdgeInsets.all(10),
        //                       child: Column(
        //                         children: [
        //                           Divider(
        //                             endIndent: 10,
        //                             indent: 10,
        //                             color: Colors.grey,
        //                             thickness: 1,
        //                           ),
        //                           Text(
        //                             'Total Amount: Rs. ${partyorderedData[index].totalPrice}/-',
        //                             style: TextStyle(
        //                               fontSize: 15,
        //                               color: Colors.black87,
        //                               fontWeight: FontWeight.bold,
        //                             ),
        //                           ),
        //                           Container(
        //                             height: MediaQuery.of(context).size.height *
        //                                 0.04 *
        //                                 partyorderedData[index]
        //                                     .orderedPartyMeals
        //                                     .length,
        //                             child: ListView.builder(
        //                               itemCount: partyorderedData[index]
        //                                   .orderedPartyMeals
        //                                   .length,
        //                               itemBuilder: (context, i) {
        //                                 return Row(
        //                                   children: [
        //                                     Text(
        //                                       '${partyorderedData[index].orderedPartyMeals[i].sellerFullName}',
        //                                       style: TextStyle(
        //                                         fontSize: 15,
        //                                         color: Colors.black87,
        //                                       ),
        //                                     ),
        //                                     Spacer(),
        //                                     Text(
        //                                       'Rs ${partyorderedData[index].orderedPartyMeals[i].menu[index].price}',
        //                                       style: TextStyle(
        //                                         fontSize: 15,
        //                                         color: Colors.black87,
        //                                       ),
        //                                     ),
        //                                     Container(
        //                                       margin: EdgeInsets.only(
        //                                           right: 10, left: 30),
        //                                       child: Text(
        //                                         'x ${partyorderedData[index].counters[i] + 1}',
        //                                         style: TextStyle(
        //                                           fontSize: 15,
        //                                           color: Colors.black87,
        //                                         ),
        //                                       ),
        //                                     ),
        //                                   ],
        //                                 );
        //                               },
        //                             ),
        //                           ),
        //                           Container(
        //                             margin: EdgeInsets.only(top: 10),
        //                             child: Row(
        //                               mainAxisAlignment:
        //                                   MainAxisAlignment.center,
        //                               children: [
        //                                 Container(
        //                                   width: MediaQuery.of(context)
        //                                           .size
        //                                           .width *
        //                                       0.4,
        //                                   child: RaisedButton(
        //                                     child: Text('Rate Order'),
        //                                     onPressed: () {},
        //                                   ),
        //                                 ),
        //                                 Container(
        //                                   width: MediaQuery.of(context)
        //                                           .size
        //                                           .width *
        //                                       0.4,
        //                                   margin: EdgeInsets.only(left: 20),
        //                                   child: RaisedButton(
        //                                     child: Text('Repeat Order'),
        //                                     onPressed: () {},
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                     headerBuilder:
        //                         (BuildContext context, bool isExpanded) {
        //                       return Container(
        //                         padding: EdgeInsets.all(10),
        //                         child: Column(
        //                           crossAxisAlignment: CrossAxisAlignment.start,
        //                           children: [
        //                             Text(
        //                               '${partyorderedData[index].orderedPartyMeals[index].sellerName}{Shop Name}',
        //                               style: TextStyle(
        //                                 fontSize: 15,
        //                                 color: Colors.black54,
        //                               ),
        //                             ),
        //                             Text(
        //                               '{Seller\'s Name}(Location{Area Name})',
        //                               style: TextStyle(
        //                                 fontSize: 12,
        //                                 color: Colors.grey,
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                       );
        //                     },
        //                     isExpanded: partyorderedData[index].isExpanded,
        //                   )
        //                 ],
        //                 expansionCallback: (int item, bool status) {
        //                   setState(() {
        //                     partyorderedData[index].isExpanded =
        //                         !partyorderedData[index].isExpanded;
        //                   });
        //                 },
        //               ),
        //             );
        //           },
        //         ),
        //       ),
      ],
    );
  }
}
