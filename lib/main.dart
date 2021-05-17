import 'package:flutter/material.dart';
import 'package:meals_app/category_page.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/filtering.dart';
import 'package:meals_app/meal_details.dart';
import 'package:meals_app/meals_page.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> filteringAdjustments ={
      'Gluten Free': false,
      'Lactous Free': false,
      'Is Vegan': false,
      'Is Vegeterian': false
  
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals=[];

  

  applyFiltering(Map<String,bool> filters)
  {
    setState(() {
      filteringAdjustments = filters;

      availableMeals = DUMMY_MEALS.where((meal) {
        if(filteringAdjustments['Gluten Free'] && !meal.isGlutenFree)
        {
          return false;
        }
        if(filteringAdjustments['Lactous Free'] && !meal.isLactoseFree)
        {
          return false;
        }
        if(filteringAdjustments['Is Vegan'] && !meal.isVegan)
        {
          return false;
        }
        if(filteringAdjustments['Is Vegeterian'] && !meal.isVegetarian)
        {
          return false;
        }
        return true;

      }).toList();

    
    });
  }

  _toggleFavorite(String mealId)
  {
    int mealIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    print(mealIndex);
    if(mealIndex >=0 ) //then it exsits remove it
    {
      setState(() {
        _favoriteMeals.removeAt(mealIndex);
      });
    }
    else
    {
      setState(() {
       _favoriteMeals.add(availableMeals.firstWhere((meal) => meal.id == mealId)); 
      });
    }

  }
  bool _isFavorite(String mealId)
  {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'MEAlS',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        accentColor: Colors.pink,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
   
          title: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold
          )

        ),
      ),
      // home: CategoryPage(),
      initialRoute: '/',
      routes: {
        '/': (_) => TabsScreen(this._favoriteMeals),
        '/category': (_) => CategoryPage(),
        '/meals': (_) => MealsPage(this.availableMeals),
        '/meal' : (_) => MealDetails(this._toggleFavorite,this._isFavorite),
        '/filters' : (_) => Filtering(this.filteringAdjustments,this.applyFiltering),
      },
    );
  }
}


