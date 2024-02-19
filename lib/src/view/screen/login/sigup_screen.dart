import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_style.dart';
import '../../../controller/togleC.dart';
import '../../widgets/background_img/background_forgot_pass.dart';

final TogleC c = Get.put(TogleC());

class SigUpScreen extends StatefulWidget {
  const SigUpScreen({super.key});

  @override
  State<SigUpScreen> createState() => _SigUpScreenState();
}

class _SigUpScreenState extends State<SigUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundForgot(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            title: Text('Sigup'),
            centerTitle: true,
            backgroundColor: AppStyle.backgroundcolor,
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 110, horizontal: 20),
              child: ListView(children: [
                Form(
                  key: c.formfield,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your name';
                          } else if (!RegExp(r'^[a-z A-Z]').hasMatch(value)) {
                            return 'the name must be in letters';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        controller: c.nameC,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppStyle.grey),
                                borderRadius: BorderRadius.circular(15)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppStyle.white),
                                borderRadius: BorderRadius.circular(15)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Name',
                            labelStyle: TextStyle(color: AppStyle.grey),
                            prefixIcon: Icon(Icons.person),
                            prefixIconColor: AppStyle.grey),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          print(value);
                          if (value!.isEmpty) {
                            return 'please enrer email';
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return 'please enter a email valid';
                          }
                          return null;
                        },
                        controller: c.emailC,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppStyle.grey),
                                borderRadius: BorderRadius.circular(15)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppStyle.white),
                                borderRadius: BorderRadius.circular(15)),
                            labelStyle: TextStyle(color: AppStyle.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            prefixIconColor: AppStyle.grey),
                      ),
                      SizedBox(height: 20),
                      Theme(
                        data: ThemeData(hintColor: AppStyle.grey),
                        child: Obx(() => TextFormField(
                              style: TextStyle(color: Colors.white),
                              validator: (value) {
                                print(value);
                                RegExp regex = RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');
                                if (value!.isEmpty) {
                                  return 'enter password';
                                } else if (c.passC.text.length < 8) {
                                  return 'password lenght should not be less 8 characters';
                                } else {
                                  if (!regex.hasMatch(value)) {
                                    return 'Must contain uppercase numbers and special characters';
                                  } else {
                                    return null;
                                  }
                                }
                              },
                              controller: c.passC,
                              obscureText: c.ishiden.value,
                              autocorrect: false,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppStyle.grey),
                                      borderRadius: BorderRadius.circular(15)),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppStyle.white),
                                      borderRadius: BorderRadius.circular(15)),
                                  labelStyle: TextStyle(color: AppStyle.grey),
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        c.ishiden.toggle();
                                      },
                                      child: c.ishiden.value
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.remove_red_eye)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock),
                                  prefixIconColor: AppStyle.grey,
                                  suffixIconColor: AppStyle.grey),
                            )),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                AppStyle.backgroundcolor.withOpacity(0.8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            if (c.formfield.currentState!.validate()) {
                              Get.snackbar('Berhasil', 'Register Success');
                              print('success');
                              c.passC.clear();
                              c.emailC.clear();
                              c.nameC.clear();
                            }
                          },
                          child: Text(
                            'Sig Up Account',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
