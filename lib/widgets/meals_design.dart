import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/meal_defenation.dart';
import '../provider/meal_data.dart';
import './meals_display.dart';

class MealsDesign extends StatefulWidget {
  final List<Meal> categoryMeals;

  MealsDesign(
    this.categoryMeals,
  );
  @override
  _MealsDesignState createState() => _MealsDesignState();
}

class _MealsDesignState extends State<MealsDesign> {
  @override
  Widget build(BuildContext context) {
    final mealsData = Provider.of<MealData>(context);
    return ListView.builder(
      itemCount: widget.categoryMeals.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 10,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      MealsDisplay(widget.categoryMeals[index]),
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
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image:
                            NetworkImage(widget.categoryMeals[index].imageUrl),
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
                            widget.categoryMeals[index].title,
                            style: TextStyle(color: Colors.black, fontSize: 28),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            widget.categoryMeals[index].discription[0],
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
                                semanticLabel: widget
                                    .categoryMeals[index].ratings
                                    .toString(),
                                size: 10,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 3),
                                child: Text(
                                  widget.categoryMeals[index].ratings
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
                                          .categoryMeals[index].time
                                          .toString() +
                                      ' mins',
                                  size: 10,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 3),
                                child: Text(
                                  widget.categoryMeals[index].time.toString() +
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
                                  semanticLabel: widget
                                      .categoryMeals[index].price
                                      .toString(),
                                  size: 10,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 3),
                                child: Text(
                                  'Rs. ' +
                                      widget.categoryMeals[index].price
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                  onPressed: () {
                                    mealsData.changeFav(
                                        widget.categoryMeals[index].id);
                                  },
                                  icon: widget.categoryMeals[index].isFav
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
    );
  }
}
