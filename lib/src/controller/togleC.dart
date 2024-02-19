import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TogleC extends GetxController {
  var ishiden = true.obs;
  final formfield = GlobalKey<FormState>();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  final TextEditingController nameC = TextEditingController();
}
