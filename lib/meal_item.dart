import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem(this.meal);

  void openMeal(BuildContext context) {
    Navigator.of(context).pushNamed('/meal', arguments: this.meal);
  }

  String get complexityAsText {
    switch (this.meal.complexity) {
      case Complexity.Simple:
        return 'Simple';

        break;

      case Complexity.Challenging:
        return 'Challenging';
        break;

      case Complexity.Hard:
        return 'Hard';
        break;

      default:
        return 'Unknown';

        break;
    }
  }

   String get pricingAsText {
    switch (this.meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';

        break;

      case Affordability.Pricey:
        return 'Pricey';
        break;

      case Affordability.Luxurious:
        return 'Luxurious';
        break;

      default:
        return 'Unknown';

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openMeal(context),
      child: Card(
        elevation: 8,
        margin: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    this.meal.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    color: Colors.black54,
                    child: Text(
                      this.meal.title,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // for duration
                Row(
                  children: <Widget>[
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 3,

                    ),
                    Text('${this.meal.duration} min')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.work),
                    SizedBox(
                      width: 3,
                    ),
                    Text(this.complexityAsText)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 3,
                    ),
                    Text(this.pricingAsText)
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
