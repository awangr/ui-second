import 'package:flutter/material.dart';

class BottomNavigationModel {
  final Widget disableIcon;
  final Widget enableIcon;
  String label;
  bool isSelected;
  BottomNavigationModel(this.disableIcon, this.enableIcon, this.label,
      {this.isSelected = false});
}
