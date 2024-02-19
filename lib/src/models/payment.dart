import 'package:flutter/material.dart';

class Payment {
  String title;
  String Subtitle;
  Widget leading;
  String trailing;
  List<Payment> tiles;
  Payment(
      {required this.title,
      required this.Subtitle,
      required this.leading,
      required this.trailing,
      this.tiles = const []});
}
