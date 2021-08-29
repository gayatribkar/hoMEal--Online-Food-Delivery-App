import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:provider/provider.dart';

import '../provider/meal_data.dart';
import '../provider/categories_data.dart';
import '../provider/user_data.dart';
import '../models/meal_defenation.dart';
import '../widgets/meals_display.dart';
import '../icons/filter_icons.dart';

// ignore: must_be_immutable
class Home extends KFDrawerContent {
  static const routename = "/home-page";

  Home({
    Key key,
  });

  @override
  _HomeState createState() => _HomeState();
}

var _isVeg2 = false;

class _HomeState extends State<Home> {
  Map<String, bool> _filters = {
    'vegetarian': false,
  };

  void saveFilters(
      Map<String, bool> filterData, MealData mealsData, List<Meal> mealsItems) {
    setState(() {
      _filters = filterData;

      mealsItems = mealsData.applyFilters(_filters);
    });
  }

  void _selectHomeCategory(BuildContext ctx, index, List<Meal> availableMeals) {
    Navigator.of(ctx).pushNamed(
      '/category-meals',
      arguments: {
        'id': my_categories[index].id,
        'title': my_categories[index].title,
        'meal': availableMeals,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealsData = Provider.of<MealData>(context);
    final userHolderData = Provider.of<UserDataFinal>(context);
    final mealsItems = mealsData.getItems(_isVeg2);
    final mostPopularMeals = mealsData.mostPopularMeal(_filters['vegetarian']);
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final id = routeArgs['id'];
    final userFirstName = userHolderData.getSingleUserData(id);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
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
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(top: 5, right: 5),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Text(
                              'Location',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Icon(
                                Icons.location_pin,
                                size:
                                    MediaQuery.of(context).size.height * 0.025,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Good Evening! ${userFirstName.firstName}',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                'Grab your',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'delicious meal!',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.6,
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
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
                          hintText: 'Restaurents, Foods...',
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 35, 0),
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.13,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(
                          Filter.filter,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                color: Theme.of(context)
                                    .backgroundColor
                                    .withOpacity(0.8),
                                child: StatefulBuilder(
                                  builder: (BuildContext context,
                                      StateSetter stateSetter) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(10),
                                            child: Text(
                                              'Apply your filters here.',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22),
                                            ),
                                          ),
                                          SwitchListTile(
                                            activeColor:
                                                Colors.lightBlueAccent[800],
                                            title: Text(
                                              'Vegetarian',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            subtitle: Text(
                                              'Only Vegetarian meals',
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.8)),
                                            ),
                                            value: _isVeg2,
                                            onChanged: (val) {
                                              stateSetter(() {
                                                _isVeg2 = val;
                                              });
                                            },
                                          ),
                                          ElevatedButton.icon(
                                            icon: Icon(
                                              Icons.save,
                                              color: Colors.white,
                                            ),
                                            label: Text(
                                              'Apply',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onPressed: () {
                                              final selectedFilters = {
                                                'vegetarian': _isVeg2,
                                              };
                                              saveFilters(selectedFilters,
                                                  mealsData, mealsItems);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Explore Catogeries ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 40),
                        child: IconButton(
                          icon: Icon(Icons.more_horiz_rounded),
                          iconSize: 30,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 1,
                    children: List.generate(
                      6,
                      (index) => Card(
                        elevation: 3,
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            _selectHomeCategory(context, index, mealsItems);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  my_categories[index].image,
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
                                    color: Colors.black87,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0)),
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                            my_categories[index].title,
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
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Most Popular ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 40),
                        child: IconButton(
                          icon: Icon(Icons.more_horiz_rounded),
                          iconSize: 30,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        height: MediaQuery.of(context).size.height * 0.497,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: mostPopularMeals.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 10,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MealsDisplay(mostPopularMeals[index]),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    bottom: 10,
                                    top: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 125,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            topLeft: Radius.circular(10),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                mostPopularMeals[index]
                                                    .imageUrl),
                                            fit: BoxFit.cover,
                                          ),
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
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              child: Text(
                                                mostPopularMeals[index].title,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.08,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.vertical,
                                                child: Text(
                                                  mostPopularMeals[index]
                                                      .discription[0],
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14,
                                                  ),
                                                ),
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
                                                        mostPopularMeals[index]
                                                            .ratings
                                                            .toString(),
                                                    size: 10,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 2),
                                                    child: Text(
                                                      mostPopularMeals[index]
                                                          .ratings
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    child: Icon(
                                                      Icons.timer,
                                                      color: Colors.black,
                                                      semanticLabel:
                                                          mostPopularMeals[
                                                                      index]
                                                                  .time
                                                                  .toString() +
                                                              ' mins',
                                                      size: 10,
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 2),
                                                    child: Text(
                                                      mostPopularMeals[index]
                                                              .time
                                                              .toString() +
                                                          ' mins',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    child: Icon(
                                                      Icons
                                                          .account_balance_wallet,
                                                      color: Colors.black,
                                                      semanticLabel:
                                                          mostPopularMeals[
                                                                  index]
                                                              .price
                                                              .toString(),
                                                      size: 10,
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 2),
                                                    child: Text(
                                                      'Rs. ' +
                                                          mostPopularMeals[
                                                                  index]
                                                              .price
                                                              .toString(),
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5),
                                                    child:
                                                        mostPopularMeals[index]
                                                                .isFav
                                                            ? Icon(
                                                                Icons.favorite,
                                                                size: 15,
                                                                color:
                                                                    Colors.red,
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .favorite_border_rounded,
                                                                color: Colors
                                                                    .transparent,
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
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
