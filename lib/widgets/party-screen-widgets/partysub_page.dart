import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/partyOrders_data.dart';
import '../../widgets/party-screen-widgets/party_ChatPage.dart';
import '../../widgets/party-screen-widgets/partyCart_page.dart';

class PartySubPage extends StatefulWidget {
  final String id;
  PartySubPage(this.id);
  @override
  _PartySubPageState createState() => _PartySubPageState();
}

class _PartySubPageState extends State<PartySubPage> {
  int i = 1;

  bool showBottomBar = false;

  @override
  Widget build(BuildContext context) {
    final partyOrderData = Provider.of<PartyOrderData>(context);
    final currentMealData = partyOrderData.chooseByIndex(widget.id);

    return Scaffold(
      floatingActionButton:
          partyOrderData.totalQuantity(currentMealData.id) == 0
              ? FloatingActionButton(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.chat),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PartyChat(),
                      ),
                    );
                  },
                )
              : Container(
                  margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.00,
                ),
      appBar: AppBar(
        title: Text(
          currentMealData.sellerName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {},
          )
        ],
      ),
      bottomNavigationBar: partyOrderData.totalQuantity(currentMealData.id) == 0
          ? Container(
              margin: EdgeInsets.only(left: 5, right: 5),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.00,
            )
          : Container(
              margin: EdgeInsets.only(left: 5, right: 5),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.08,
              child: RaisedButton(
                color: Color(0xff00001a),
                child: Row(
                  children: [
                    Text(
                      "${partyOrderData.totalQuantity(currentMealData.id)} items | Rs.${partyOrderData.totalPrice(currentMealData.id)} ",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Divider(),
                    Spacer(),
                    Text(
                      "PROCEED",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(PartyCart.routeName,
                      arguments: {'id': currentMealData.id});
                },
              ),
            ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 12, bottom: 10),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    currentMealData.sellerFullName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(12),
                  color: Colors.transparent,
                  child: ListView.builder(
                    itemCount: currentMealData.menu.length,
                    itemBuilder: (context, index) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: currentMealData.menu[index].isClicked,
                          onChanged: (value) {
                            partyOrderData
                                .changedClick(currentMealData.menu[index]);
                          },
                        ),
                        Container(
                          // color: Colors.amber,
                          padding: EdgeInsets.only(top: 8.0),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Text(
                              currentMealData.menu[index].title,
                            ),
                          ),
                        ),
                        Spacer(),
                        !currentMealData.menu[index].isClicked &&
                                currentMealData.menu[index].quantity <= 0
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'Rs.${currentMealData.menu[index].price}'),
                              )
                            : Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.455,
                                child: Row(
                                  children: [
                                    Text(
                                        'Rs.${partyOrderData.setPrice(currentMealData.menu[index].quantity, currentMealData.menu[index].price)}'),
                                    Spacer(),
                                    IconButton(
                                      icon: Icon(
                                          Icons.add_circle_outline_rounded),
                                      onPressed: () {
                                        partyOrderData.incrementPartyMeal(
                                            currentMealData.id,
                                            currentMealData.menu[index].id);
                                      },
                                    ),
                                    Text(
                                        '${partyOrderData.getSingleCounter(currentMealData.id, currentMealData.menu[index].id)}'),
                                    IconButton(
                                      icon: Icon(Icons.do_disturb_on_outlined),
                                      onPressed: () {
                                        partyOrderData.decrementPartyMeal(
                                            currentMealData.id,
                                            currentMealData.menu[index].id);
                                        partyOrderData.changedClick(
                                            currentMealData.menu[index]);
                                      },
                                    )
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
