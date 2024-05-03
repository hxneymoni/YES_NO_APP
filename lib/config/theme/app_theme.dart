import 'package:flutter/material.dart';

const Color _customColor =Color(0X005C11D4);

const List<Color> _colorThemes = [
_customColor,
Colors.blue,
Colors.purple,
Colors.pink,
Colors.orange,
Colors.lightBlue,
Colors.brown,
Colors.black
];

class AppTheme{
  final int selectedColor;

  AppTheme({this.selectedColor=0}) : assert(selectedColor >=0 && selectedColor <= _colorThemes.length -1, 'Colors must be between 0 and ${ _colorThemes.length}');

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor]
    );
  }
}