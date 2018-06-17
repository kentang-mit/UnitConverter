import 'package:flutter/material.dart';
import 'package:convertor_app/category.dart';
import 'package:convertor_app/unit.dart';
import 'dart:convert';
import 'dart:async';

final _backgroundColor = Colors.green[100];

class CategoryRoute extends StatefulWidget{
  const CategoryRoute();

  @override
  _CategoryRouteState createState()=> _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute>{
  Category _defaultCategory;
  Category _currentCategory;
  final _categories = <Category>[];
  final _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];
  final _icons = <String>[
    'assets/icons/length.png',
    'assets/icons/area.png',
    'assets/icons/volume.png',
    'assets/icons/mass.png',
    'assets/icons/time.png',
    'assets/icons/digital_storage.png',
    'assets/icons/power.png',
    'assets/icons/currency.png',
  ];

  @override
  Future<void> didChangeDependencies()async{
    if(_categories.isEmpty){
      await _retrieveLocalCategories();
    }
  }

  Future<void> _retrieveLocalCategories()async{
    final json = DefaultAssetBundle.of(context).loadString(
      'assets/data/regular_units.json'
    );
    final data = JsonDecoder().convert(await json);
    var categoryIndex = 0;
    data.keys.forEach((key){
      final List<Unit> units = 
        data[key].map<Unit>(
          (dynamic data)=>Unit.fromJson(data)).toList();
        var category = Category(
          name: key,
          units: units,
          color: _baseColors[categoryIndex],
          iconLocation: _icons[categoryIndex],
        );
        setState((){
          if(categoryIndex == 0){
            _defaultCategory = category;
          }
          _categories.add(category);
        });
        categoryIndex += 1;
    });
  }

  Widget _buildCategoryWidgets(){
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => _categories[index],
      itemCount: _categories.length,
    );
  }

  @override
  Widget build(BuildContext context){
    if(_categories.isEmpty){
      return Center(
        child: Container(
          height: 180.0,
          width: 180.0,
          child: CircularProgressIndicator(),
        ),
      );
    }
    else{
      final listview = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(),
      );

      return Scaffold(body:listview);
    }
  }


}