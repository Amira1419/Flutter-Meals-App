
import 'package:flutter/material.dart';
import 'package:meals_app/meals_page.dart';
import 'package:meals_app/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category item;

  CategoryItem(this.item);

  openMealsPage(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/meals',
      arguments: {'category':this.item}
    );
    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (_) => MealsPage(this.item)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: () => openMealsPage(context),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            this.item.title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [this.item.color, this.item.color.withOpacity(0.7)],
              begin: Alignment.topLeft,
              end: Alignment.topRight),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
