import 'package:flutter/material.dart';

class ListTileModel {
  String title;
  Widget leading;
  Widget trailing;
  VoidCallback onTap;
  ListTileModel(
      {required this.title,
      required this.leading,
      required this.trailing,
      required this.onTap});
}
