import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFormC extends GetxController {
  var isHiden = true.obs;

  final formfield = GlobalKey<FormState>();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();
}
