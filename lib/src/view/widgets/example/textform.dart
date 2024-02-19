import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_style.dart';
import 'textfomrC.dart';

final TextFormC c = Get.put(TextFormC());

class TextForm extends StatefulWidget {
  const TextForm({super.key});

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.backgroundcolor,
        centerTitle: true,
        title: Text('Text Form Field'),
      ),
      body: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              child: Center(
                child: Form(
                  key: c.formfield,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppStyle.backgroundcolor,
                        backgroundImage:
                            AssetImage('assets/images/background/Study.png'),
                        radius: 100,
                      ),
                      SizedBox(height: 30),
                      TextFormField(
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
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email)),
                      ),
                      SizedBox(height: 20),
                      Obx(() => TextFormField(
                            validator: (value) {
                              print(value);
                              RegExp regex = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
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
                            obscureText: c.isHiden.value,
                            autocorrect: false,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                suffixIcon: InkWell(
                                    onTap: () {
                                      c.isHiden.toggle();
                                    },
                                    child: c.isHiden.value
                                        ? Icon(Icons.remove_red_eye)
                                        : Icon(Icons.visibility_off)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock)),
                          )),
                      SizedBox(height: 20),
                      MaterialButton(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          if (c.formfield.currentState!.validate()) {
                            print('Success');
                            c.emailC.clear();
                            c.passC.clear();
                          }
                        },
                        color: AppStyle.backgroundcolor,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: AppStyle.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
