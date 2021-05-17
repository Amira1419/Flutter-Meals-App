import 'package:flutter/material.dart';

class Filtering extends StatefulWidget {
  final Function _saveFilters;
  final Map<String,bool> currentFilters;

  Filtering(this.currentFilters,this._saveFilters);

  @override
  _FilteringState createState() => _FilteringState();
}

class _FilteringState extends State<Filtering> {
  bool _glutenFree = false;
  bool _lactousFree = false;
  bool _vegan = false;
  bool _vegeterian = false;

  @override
  initState()
  {
    _glutenFree = widget.currentFilters['Gluten Free'];
    _lactousFree = widget.currentFilters['Lactous Free'];
    _vegan = widget.currentFilters['Is Vegan'];
    _vegeterian = widget.currentFilters['Is Vegeterian'];


  }

  Map<String, bool> filtersAdjustments;

  Widget switchListTileDynamic(
      String text, bool fiteringSwitch, Function changingSwitch) {
    return SwitchListTile(
        title: Text(text),
        value: fiteringSwitch,
        onChanged: (newValue) => changingSwitch(newValue));
  }

  void _saveFilters() {
    filtersAdjustments=
      {
      'Gluten Free': _glutenFree,
      'Lactous Free': _lactousFree,
      'Is Vegan': _vegan,
      'Is Vegeterian': _vegeterian
      };
    widget._saveFilters(this.filtersAdjustments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered Meals'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: this._saveFilters
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(10),
            child: Text('Filter the meals',
                style: Theme.of(context).textTheme.title),
            color: Theme.of(context).accentColor,
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                switchListTileDynamic('Gluten Free Meals', _glutenFree,
                    (bool newVal) {
                  setState(() {
                    _glutenFree = newVal;
                  });
                }),
                switchListTileDynamic('Lactous Free Meals', _lactousFree,
                    (bool newVal) {
                  setState(() {
                    _lactousFree = newVal;
                  });
                }),
                switchListTileDynamic('Vegan Meals', _vegan, (bool newVal) {
                  setState(() {
                    _vegan = newVal;
                  });
                }),
                switchListTileDynamic('Vegeterian Meals', _vegeterian,
                    (bool newVal) {
                  setState(() {
                    _vegeterian = newVal;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
