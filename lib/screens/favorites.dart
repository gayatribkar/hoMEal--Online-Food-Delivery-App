import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kf_drawer/kf_drawer.dart';

import '../provider/meal_data.dart';
import '../widgets/fav_widegt.dart';

// ignore: must_be_immutable
class Favorites extends KFDrawerContent {
  static const routename = "/favorites-page";

  Favorites({
    Key key,
  });

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    final mealData = Provider.of<MealData>(context);
    final favoriteMeals = mealData.favMeals;
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
                    'Favorites',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            favoriteMeals.isEmpty
                ? Expanded(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 125, bottom: 50),
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: AssetImage('images/fav_img.gif'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'No Favorite item found :(',
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
                    child: FavoritesWidget(),
                  ),
          ],
        ),
      ),
    );
  }
}
