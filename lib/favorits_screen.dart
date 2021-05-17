import 'package:flutter/material.dart';
import 'package:meals_app/meal_item.dart';
import 'package:meals_app/models/meal.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> _favoriteMeals;
  FavoritesScreen(this._favoriteMeals);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return widget._favoriteMeals.isEmpty?
    Center(
      child: Text('No Favorites Yet'),
    ):
    ListView.builder(
        itemBuilder: (ctx,index){
          return MealItem(widget._favoriteMeals[index]);
        },
        itemCount: widget._favoriteMeals.length,
      );
  }
}