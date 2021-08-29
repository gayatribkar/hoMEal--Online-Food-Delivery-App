import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/provider/partyOrders_data.dart';
import '../widgets/party-screen-widgets/partysub_page.dart';
import 'package:kf_drawer/kf_drawer.dart';
import '../provider/partyOrders_data.dart';
import 'package:provider/provider.dart';
import '../widgets/party-screen-widgets/party_page.dart';

// ignore: must_be_immutable
class PartyOrders extends KFDrawerContent {
  static const routename = "/Party-List";

  PartyOrders({
    Key key,
  });

  @override
  _PartyOrdersState createState() => _PartyOrdersState();
}

class _PartyOrdersState extends State<PartyOrders> {
  @override
  Widget build(BuildContext context) {
    final partyOrderData = Provider.of<PartyOrderData>(context);
    final categoryPartyMeals = partyOrderData.item;
    final mostPopPartyMeal = partyOrderData.mostPopularMeal();
    final pMeal = partyOrderData.getPartyMeal();
    final tMeal = partyOrderData.getTiffinMeal();

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
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.875,
                    margin: EdgeInsets.only(top: 8, left: 15, right: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                        ),
                      ],
                    ),
                    child: TextField(
                      style: TextStyle(
                        decoration: TextDecoration.none,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Restaurant,Seller name...',
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 8,
                      left: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "PARTY ORDERS",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          child: IconButton(
                            icon: Icon(Icons.more_horiz_rounded),
                            iconSize: 30,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PartyPageDesign(pMeal),
                                  settings:
                                      RouteSettings(arguments: 'PARTY ORDERS'),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.185,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: GridView.count(
                      scrollDirection: Axis.horizontal,
                      crossAxisCount: 1,
                      children: List.generate(
                        5,
                        (index) => Card(
                          elevation: 3,
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PartySubPage(pMeal[index].id),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    pMeal[index].iconImage,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  DecoratedBox(
                                    decoration: const BoxDecoration(
                                      // color: Color(0xAA000000),
                                      color: Colors.black87,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0)),
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      // height: 101,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Text(
                                              pMeal[index].sellerName,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 18,
                      left: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TIFFIN SERVICE...",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          child: IconButton(
                            icon: Icon(Icons.more_horiz_rounded),
                            iconSize: 30,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PartyPageDesign(tMeal),
                                  settings: RouteSettings(
                                      arguments: 'TIFFIN SERVICE'),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.185,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: GridView.count(
                      scrollDirection: Axis.horizontal,
                      crossAxisCount: 1,
                      children: List.generate(
                        5,
                        (index) => Card(
                          elevation: 3,
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PartySubPage(tMeal[index].id),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    tMeal[index].iconImage,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  DecoratedBox(
                                    decoration: const BoxDecoration(
                                      // color: Color(0xAA000000),
                                      color: Colors.black87,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0)),
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      // height: 101,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Text(
                                              tMeal[index].sellerName,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 18,
                      left: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "MOST POPULAR",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          child: IconButton(
                            icon: Icon(Icons.more_horiz_rounded),
                            iconSize: 30,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PartyPageDesign(mostPopPartyMeal),
                                  settings:
                                      RouteSettings(arguments: 'MOST POPULAR'),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // height: MediaQuery.of(context).size.height * 0.185,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: mostPopPartyMeal.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.185,
                            child: Card(
                              elevation: 3,
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => PartySubPage(
                                          mostPopPartyMeal[index].id),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(8),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            mostPopPartyMeal[index].iconImage,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, bottom: 25, left: 6),
                                            child: Text(
                                              mostPopPartyMeal[index]
                                                  .sellerName,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.black,
                                                  semanticLabel:
                                                      mostPopPartyMeal[index]
                                                          .ratings
                                                          .toString(),
                                                  size: 10,
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 3),
                                                  child: Text(
                                                    mostPopPartyMeal[index]
                                                        .ratings
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 3),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      partyOrderData.changeFav(
                                                          categoryPartyMeals[
                                                                  index]
                                                              .id);
                                                    },
                                                    icon: categoryPartyMeals[
                                                                index]
                                                            .isFav
                                                        ? Icon(
                                                            Icons.favorite,
                                                            size: 20,
                                                          )
                                                        : Icon(
                                                            Icons
                                                                .favorite_border_rounded,
                                                            size: 20,
                                                          ),
                                                    color: Colors.red,
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
                            ),
                          );
                        },
                      ),
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
