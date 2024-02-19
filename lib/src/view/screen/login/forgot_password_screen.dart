import 'package:flutter/material.dart';
import 'package:project2/core/app_style.dart';
import 'package:project2/src/view/widgets/background_img/background_forgot_pass.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundForgot(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            title: Text('Forgot Password'),
            centerTitle: true,
            backgroundColor: AppStyle.backgroundcolor,
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 110, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Theme(
                      data: ThemeData(hintColor: AppStyle.grey),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppStyle.grey),
                              borderRadius: BorderRadius.circular(15)),
                          labelText: 'New Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Theme(
                      data: ThemeData(hintColor: AppStyle.grey),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppStyle.grey),
                              borderRadius: BorderRadius.circular(15)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppStyle.white),
                              borderRadius: BorderRadius.circular(15)),
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppStyle.white, width: 1.0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
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
                        onPressed: () {},
                        child: Text(
                          'Change Password',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
