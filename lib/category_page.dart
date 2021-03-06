import 'package:flutter/material.dart';
import 'package:meals_app/category_item.dart';
import 'package:meals_app/dummy_data.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    // Scaffold(
    //   appBar: AppBar(
    //     title: const Text('MEals'),
    //   ),
    //   body: 
      GridView(
        padding: EdgeInsets.all(10),
        children: DUMMY_CATEGORIES.map((category) => CategoryItem(category)).toList(),

        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      // ),
    );
  }
}
