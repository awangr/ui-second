import 'package:flutter/material.dart';
import 'package:project2/core/app_style.dart';

class AppBlur {
  AppBlur._();
  static List<BoxShadow> blurInkBig = [
    BoxShadow(
        blurRadius: 9,
        offset: Offset(0, 3),
        blurStyle: BlurStyle.outer,
        color: AppStyle.backgroundcolor.withOpacity(0.9))
  ];
}

class AppProfile {
  AppProfile._();
  static const name_profile = 'Awang';
  static const email_profile = 'awangrhomadon@gmail.com';
  static const no_profile = '089517288464';
}
