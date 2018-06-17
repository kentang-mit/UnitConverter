import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'convertor_route.dart';
import 'package:convertor_app/unit.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Category extends StatelessWidget{
  final String name;
  final ColorSwatch color;
  final String iconLocation;
  final List<Unit> units;
  const Category({
    Key key,
    @required this.name,
    @required this.color,
    @required this.iconLocation,
    @required this.units,
  }) : assert(name != null),
      assert(color != null),
      assert(units != null),
      super(key: key);
  
  void _navigateToConvertor(context){
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context){
        return Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text(
              name,
              style: Theme.of(context).textTheme.display1,
            ),
            centerTitle: true,
            backgroundColor: color,
          ),
          body: ConvertorRoute(
            color: color,
            name: name,
            units: units,
          ),
        );
      } 
      )
    );
  }
  @override
  Widget build(BuildContext context){
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: color,
          splashColor: color,
          onTap: (){
            _navigateToConvertor(context);
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Image.asset(iconLocation),
                  ),
                  Center(
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}