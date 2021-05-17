import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetails extends StatelessWidget {
  final Function _toggleFavorite;
  final Function _isFavorite;

  MealDetails(this._toggleFavorite,this._isFavorite);
  @override
  Widget build(BuildContext context) {
    final Meal selecetdMeal = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(selecetdMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              height: 250,

              child: Image.network(
                selecetdMeal.imageUrl,
                fit: BoxFit.cover,
              ),
              // ),
            ),
            Text('Ingerdients', style: Theme.of(context).textTheme.title),
            stepsOrIngredients(context, selecetdMeal.ingredients, 0),
            Text('Steps', style: Theme.of(context).textTheme.title),
            stepsOrIngredients(context, selecetdMeal.steps, 1),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_isFavorite(selecetdMeal.id)? Icons.favorite : Icons.favorite_border),
        onPressed: () => _toggleFavorite(selecetdMeal.id),
      ),
    );
  }

  Widget stepsOrIngredients(BuildContext context, List<String> list, int sOrI) {
    // sori stands for steps or ingredients
    // sori = 0 in case of ingredients or = 1 in case of steps

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).accentColor, width: 2),
      ),
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * (sOrI == 0 ? 0.3 : 0.4),
      width: MediaQuery.of(context).size.width * (sOrI == 0 ? 0.6 : 0.8),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, index) => ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.lightBlue,
            child: Text(
              '${index + 1}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18),
            ),
            radius: 20,
          ),
          title: Text(
            '${list[index]}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
