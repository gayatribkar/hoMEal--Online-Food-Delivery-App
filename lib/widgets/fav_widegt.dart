import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './meals_display.dart';
import '../provider/meal_data.dart';

class FavoritesWidget extends StatelessWidget {
  const FavoritesWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealData = Provider.of<MealData>(context);
    final favoriteMeals = mealData.favMeals;
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 10,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MealsDisplay(favoriteMeals[index]),
                ));
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
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(favoriteMeals[index].imageUrl),
                          fit: BoxFit.cover,
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
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              favoriteMeals[index].title,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 28),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              favoriteMeals[index].discription[0],
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
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
                                      favoriteMeals[index].ratings.toString(),
                                  size: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 3),
                                  child: Text(
                                    favoriteMeals[index].ratings.toString(),
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
                                    semanticLabel:
                                        favoriteMeals[index].time.toString() +
                                            ' mins',
                                    size: 10,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 3),
                                  child: Text(
                                    favoriteMeals[index].time.toString() +
                                        ' mins',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.account_balance_wallet,
                                    color: Colors.black,
                                    semanticLabel:
                                        favoriteMeals[index].price.toString(),
                                    size: 10,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 3),
                                  child: Text(
                                    'Rs. ' +
                                        favoriteMeals[index].price.toString(),
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: IconButton(
                                    onPressed: () {
                                      mealData
                                          .changeFav(favoriteMeals[index].id);
                                    },
                                    icon: favoriteMeals[index].isFav
                                        ? Icon(
                                            Icons.favorite,
                                            size: 25,
                                          )
                                        : Icon(
                                            Icons.favorite_border_rounded,
                                            size: 25,
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
    );
  }
}
