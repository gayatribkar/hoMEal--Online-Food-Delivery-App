import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/meal_defenation.dart';
import '../provider/meal_data.dart';

class MealsDisplay extends StatefulWidget {
  final Meal meal;

  MealsDisplay(this.meal);

  @override
  _MealsDisplayState createState() => _MealsDisplayState(meal);
}

class _MealsDisplayState extends State<MealsDisplay> {
  Meal meal;
  _MealsDisplayState(this.meal);

  int i = 1;

  void showSnackBarFinal(String title) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(title),
      duration: Duration(seconds: 1),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final mealData = Provider.of<MealData>(context);
    final cartMealLength = mealData.getCartMealLength();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: meal.isFav
                ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.favorite_border_rounded,
                    color: Colors.red,
                  ),
            onPressed: () {
              mealData.changeFav(meal.id);
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(meal.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  'From: ${meal.sellerName} - ' +
                      meal.title +
                      '  Rs.${meal.price}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              margin: EdgeInsets.only(left: 10, right: 10),
              child: ListView.builder(
                itemCount: meal.discription.length,
                itemBuilder: (context, index) {
                  return Text(
                    meal.discription[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            //  cartMealLength != 0 &&
            //       mealData.getSingleCartMeal().sellerName != meal.sellerName
            //   ?
            //   :
            !meal.isCart
                ? Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: RaisedButton(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.8),
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              cartMealLength != 0 &&
                                      mealData.getSingleCartMeal().sellerName !=
                                          meal.sellerName
                                  ? showSnackBarFinal(
                                      'Sorry cannot add item from this seller right now :(')
                                  : setState(() {
                                      meal.isCart = !meal.isCart;
                                    });
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    color: Theme.of(context).primaryColor.withOpacity(0.8),
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Card(
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                      elevation: 10,
                      child: GestureDetector(
                        onTap: () {
                          mealData.addToCart(meal.id);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_rounded,
                              color: Colors.green,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Added to Cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
