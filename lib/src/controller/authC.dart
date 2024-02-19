import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../core/app_style.dart';

class AuthC extends GetxController {
  var isAuth = false.obs;
  var rememberme = false.obs;
  late TextEditingController emailC;
  late TextEditingController passC;
  Map<String, String> dataUser = {
    'email': 'admin@gmail.com',
    'pass': 'admin',
  };
  //void login
  void snackEror(String msgeror) {
    Get.snackbar('Terjadi Kesalahan', msgeror,
        icon: Icon(Icons.cancel, color: AppStyle.white),
        colorText: Colors.white,
        backgroundColor: Colors.pink,
        duration: Duration(seconds: 2));
  }

  void snackSucces(String msgsucces) {
    Get.snackbar('Sukses', msgsucces,
        colorText: AppStyle.grey,
        icon: Icon(Icons.check, color: AppStyle.grey),
        backgroundColor: AppStyle.backgroundcolor,
        duration: Duration(seconds: 3));
  }

  void snackWarning(String msgwarning) {
    Get.snackbar('Terjadi Kesalahan', msgwarning,
        colorText: AppStyle.grey,
        icon: Icon(Icons.check, color: AppStyle.grey),
        backgroundColor: Colors.amber,
        duration: Duration(seconds: 2));
  }

  void loadingCircular() {
    Get.dialog(Center(
      child: CircularProgressIndicator(
        backgroundColor: AppStyle.backgroundcolor,
        color: AppStyle.grey,
      ),
    ));
  }

  void login(String email, pass, bool rememberme) async {
    if (email != '' && pass != '') {
      if (GetUtils.isEmail(email)) {
        if (email == dataUser['email'] && pass == dataUser['pass']) {
          //berhasil login
          /*  loadingCircular(); */
          await Future.delayed(Duration(seconds: 3));
          snackSucces('Berhasil Login');
          if (rememberme) {
            //simpan di storage
            final box = GetStorage();
            box.write('dataUser',
                {'email': email, 'pass': pass, 'rememberme': rememberme});
          } else {
            /* 'hapus storage' */
            final box = GetStorage();
            if (box.read('dataUser') != null) {
              /* 'hapus storage' */
              box.erase();
            }
          }
          isAuth.value = true;
        }
        if (email != dataUser['email']) {
          snackEror('Email Tidak Ditemukan');
        } else if (pass != dataUser['pass']) {
          snackEror('Password salah');
        }
      } else {
        snackEror('Ini Bukan bentuk email');
      }
    } else {
      snackEror('Semua Data harus diisi');
    }
  }

  Future<void> autoLogin() async {
    final box = GetStorage();
    if (box.read('dataUser') != null) {
      final data = box.read('dataUser') as Map<String, dynamic>;
      login(data['email'], data['pass'], data['rememberme']);
    }
  }

  void logout() async {
    final box = GetStorage();
    if (box.read('dataUser') != null) {
      box.erase();
    }
    isAuth.value = false;
  }
}
