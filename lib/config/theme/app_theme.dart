import 'package:flutter/material.dart';

const colorList = <Color> [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.teal,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.yellow,
  Colors.deepPurple,

];

class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }): assert( selectedColor >= 0, 'Selected Color must be greater then 0' ),
      assert( selectedColor < colorList.length, 
      'Selected Color must be less or equal then ${colorList.length - 1}' );


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList [ selectedColor ],
    appBarTheme: const AppBarTheme(
      centerTitle: true
    )
  );
  

}