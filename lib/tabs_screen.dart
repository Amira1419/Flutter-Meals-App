import 'package:flutter/material.dart';
import 'package:meals_app/category_page.dart';
import 'package:meals_app/favorits_screen.dart';
import 'package:meals_app/main_drawer.dart';
import 'package:meals_app/models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String,Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
     _pages = [
    {'Page':CategoryPage(),'title':'Categories'},
    {'Page':FavoritesScreen(widget.favoriteMeals),'title':'Favorites'}];

    super.initState();
  }


  void _selectTab(int index)
  {
    setState(() {
     _selectedPageIndex = index; 
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('${_pages[_selectedPageIndex]['title']}'),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['Page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        onTap: _selectTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Category')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorite')
          )
        ],
      ),
      
    );
  }
}