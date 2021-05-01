import 'package:flutter/material.dart';
import 'package:meals_app/category_page.dart';
import 'package:meals_app/meals_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MEAlS',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.blue,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
   
          title: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold
          )

        ),
      ),
      home: CategoryPage(),
      routes: {
        '/meals': (_) => MealsPage(),
      },
    );
  }
}


