import 'package:flutter/material.dart';

import './meals_design.dart';
import '../models/meal_defenation.dart';

class HomeSubCategories extends StatefulWidget {
  @override
  _HomeSubCategoriesState createState() => _HomeSubCategoriesState();
}

class _HomeSubCategoriesState extends State<HomeSubCategories> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;

    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final List<Meal> meal = routeArgs['meal'];

    final categoryMeals = meal.where((element) {
      return element.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: MealsDesign(categoryMeals),
    );
  }
}
