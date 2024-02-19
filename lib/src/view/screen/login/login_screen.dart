import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/app_style.dart';
import 'package:project2/src/controller/authC.dart';
import 'package:project2/src/controller/loginC.dart';
import 'package:project2/src/controller/project_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/src/view/screen/login/sigup_screen.dart';
import '../../widgets/background_img/background_image.dart';
import 'forgot_password_screen.dart';

final controller = Get.put(ProjectController());
final loginC = Get.put(LoginC());
final authC = Get.put(AuthC());

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(children: [
      BackgroundImage(),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: ListView(physics: NeverScrollableScrollPhysics(), children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.1),
                Center(
                  child: SizedBox(
                    width: width,
                    height: height,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppStyle.backgroundcolor,
                            radius: 50,
                            child: Center(
                              child: Icon(
                                Icons.person_2,
                                color: AppStyle.white,
                                size: 40,
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade700.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'email harus diisi';
                                }
                                return null;
                              },
                              autocorrect: false,
                              style: TextStyle(color: Colors.white),
                              controller: loginC.emailC,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email,
                                      color: Colors.grey.shade400),
                                  labelText: 'Email',
                                  labelStyle:
                                      TextStyle(color: Colors.grey.shade400),
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(height: 20),
                          Obx(
                            () => Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade700.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextFormField(
                                autocorrect: false,
                                style: TextStyle(color: Colors.white),
                                controller: loginC.passwordC,
                                obscureText: loginC.isHidden.value,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock,
                                        color: Colors.grey.shade400),
                                    suffixIcon: Obx(() => InkWell(
                                          onTap: () {
                                            loginC.isHidden.toggle();
                                          },
                                          child: Icon(
                                              loginC.isHidden.value
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Colors.grey.shade400),
                                        )),
                                    labelText: 'Password',
                                    labelStyle:
                                        TextStyle(color: Colors.grey.shade400),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Obx(() => SizedBox(
                                height: 55,
                                child: CheckboxListTile(
                                    activeColor: AppStyle.backgroundcolor,
                                    tileColor: AppStyle.grey.withOpacity(0.2),
                                    shape: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    selectedTileColor: AppStyle.backgroundcolor,
                                    checkColor: AppStyle.grey,
                                    title: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        'remember me',
                                        style: TextStyle(color: AppStyle.grey),
                                      ),
                                    ),
                                    value: loginC.rememberme.value,
                                    onChanged: (val) =>
                                        loginC.rememberme.toggle()),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Get.to(ForgotPasswordScreen(),
                                        duration: Duration(milliseconds: 700),
                                        transition: Transition.native);
                                  },
                                  child: Text(
                                    'forgot password ?',
                                    style: GoogleFonts.dosis(
                                        fontSize: 16, color: Colors.white),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 50,
                            width: width * 0.6,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: AppStyle.backgroundcolor,
                              onPressed: () {
                                authC.login(
                                    loginC.emailC.text,
                                    loginC.passwordC.text,
                                    loginC.rememberme.value);
                              },
                              child: Text(
                                'Sig In',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppStyle.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 50,
                            width: width * 0.6,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: Colors.pink,
                              onPressed: () {
                                Get.to(SigUpScreen());
                              },
                              child: Text(
                                'Sig Up',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppStyle.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    ]);
  }
}
