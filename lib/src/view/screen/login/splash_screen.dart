import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/core/app_assets.dart';
import 'package:project2/core/app_style.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/background_img/background_image2.dart';
import 'package:lottie/lottie.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(
        builder: (ctx) => const LoginScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage2(),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text('Welcome To Mels Juice',
                style: GoogleFonts.teko(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppStyle.grey)),
            SizedBox(height: 20),
            Lottie.asset('assets/images/lottie/lottie_drink.json'),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Loading',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppStyle.grey),
                ),
                SizedBox(width: 4),
                SpinKitWave(
                  color: AppStyle.grey,
                  size: 25,
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    ]);
  }
}
