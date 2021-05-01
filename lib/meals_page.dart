import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';

class MealsPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final Map<String,Object> arguments = ModalRoute.of(context).settings.arguments;
    final Category category = arguments['category'];
    final List<Meal> filteredMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);

    }).toList();

    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: category.color,
        
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx,index){
          return Card(
            child: Text(filteredMeals[index].title),

          );

        },
        itemCount: filteredMeals.length,
      ),

    );
  }
}