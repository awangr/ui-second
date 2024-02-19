import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoginC extends GetxController {
  RxBool isHidden = true.obs;
  RxBool rememberme = false.obs;
  late TextEditingController emailC;
  late TextEditingController passwordC;
  @override
  void onInit() async {
    super.onInit();
    emailC = TextEditingController();
    passwordC = TextEditingController();

    final box = GetStorage();
    if (box.read('dataUser') != null) {
      final data = box.read('dataUser') as Map<String, dynamic>;
      emailC.text = data['email'];
      passwordC.text = data['pass'];
      rememberme.value = data['rememberme'];
    }
  }

  @override
  //supaya tidak terjadi kebocoaran
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
  }
}
