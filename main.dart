import 'package:flutter/material.dart';
import 'category_route.dart';

const _categoryName = 'Helloworld';
const _categoryIcon = Icons.cake;
const _categoryColor = Colors.green;

void main(){
  runApp(UnitConvertApp());
}

class UnitConvertApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Convertor1',
      home: Scaffold(
        body: Center(
          child: CategoryRoute(),
      ),
    )
    );
  }
}
