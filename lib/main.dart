import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'example/splashscreen2.dart';
import 'src/view/screen/home/list_screen.dart';
import 'src/view/screen/login/splash_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: ListScreen(),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
      debugShowCheckedModeBanner: false,
    );
  }
}

/*class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.teal,
          canvasColor: Colors.teal,
          primaryColor: Colors.indigo),
      scrollBehavior: MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}*/
