import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class MealsPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final Map<String,Object> arguments = ModalRoute.of(context).settings.arguments;
    final Category category = arguments['category'];

    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: category.color,
        
        title: Text(category.title),
      ),
      body: Center(
        child: Text('Meals page is here'),
      ), 
    );
  }
}