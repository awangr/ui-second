import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:project2/core/app_style.dart';

import '../src/view/widgets/background_img/background_image2.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage2(),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //  Spacer(),
            /*Text('Welcome To Mels Juice',
                style: GoogleFonts.teko(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppStyle.grey)),*/
            SizedBox(height: 20),
            Lottie.asset('assets/images/lottie/lottie_drink.json'),
            SizedBox(height: 50),
            /*   Row(
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
            ),*/
            SizedBox(height: 20),
          ],
        ),
      ),
    ]);
  }
}
