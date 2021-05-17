import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {

  Widget drawerTile(IconData icon , String title, Function tabHandler)
  {
    return ListTile(
      leading: Icon(icon),
      title: Text(title,style: TextStyle(
        fontSize: 18
      ),),
      onTap: tabHandler,

    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            width: double.infinity,
            height: 200,
            child: Text('Want a delicious meal?',style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: 30
            ),),

          ),
          drawerTile(Icons.restaurant,
          'Meals',
          (){
            Navigator.of(context).pushReplacementNamed('/');
          }
          ),
          drawerTile(Icons.settings,
          'Filter',
          (){
            Navigator.of(context).pushNamed('/filters');
          }
          )
        ],
      ),
      
    );
  }
}