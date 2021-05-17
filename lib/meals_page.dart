import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/meal_item.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';

class MealsPage extends StatelessWidget {
  final List<Meal> availableMeals;

  MealsPage(this.availableMeals);


  @override
  Widget build(BuildContext context) {
    final Map<String,Object> arguments = ModalRoute.of(context).settings.arguments;
    final Category category = arguments['category'];
    final List<Meal> filteredMeals = this.availableMeals.where((meal) {
      return meal.categories.contains(category.id);

    }).toList();

    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: category.color,
        
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx,index){
          return MealItem(filteredMeals[index]);
        },
        itemCount: filteredMeals.length,
      ),

    );
  }
}