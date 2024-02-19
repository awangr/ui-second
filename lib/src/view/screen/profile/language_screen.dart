import 'package:flutter/material.dart';

import 'package:project2/core/app_style.dart';
import 'package:country_picker/country_picker.dart';
import '../../widgets/background_img/background_profile.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundPofile(),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Select Language'),
          centerTitle: true,
          backgroundColor: AppStyle.backgroundcolor,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(AppStyle.backgroundcolor),
                ),
                child: Text(
                  'Select your languge from country',
                  style: TextStyle(
                      color: AppStyle.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                onPressed: () {
                  showCountryPicker(
                      /*         onClosed: () {
                        Get.back();
                      }, */
                      context: context,
                      onSelect: (Country country) {
                        print('Select Country : ${country.displayName}');
                      });
                },
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
