import 'package:flutter/foundation.dart';

enum Complexity{
  Simple,
  Challenging,
  Hard
}
enum Affordability{

  Affordable,
  Pricey,
  Luxurious

}

class Meal 
{
  final String id;
  final int duration;
  final Complexity complexity;
  final String title;
  final List<String> categories;
  final List<String> ingredients;
  final String imageUrl;
  final List<String> steps;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal(
    {
      @required this.id,
      @required this.title,
      @required this.duration,
      @required this.complexity,
      @required this.categories,
      @required this.ingredients,
      @required this.imageUrl,
      @required this.steps,
      @required this.affordability,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian

    }
  );






}