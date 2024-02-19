import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:project2/core/app_style.dart';

import '../../widgets/background_img/background_profile.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundPofile(),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppStyle.backgroundcolor,
          title: Text('Country Screen'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Text(
                'Select your region',
                style: TextStyle(
                    color: AppStyle.backgroundcolor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              CSCPicker(
                disabledDropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.shade300,
                    border: Border.all(color: Colors.grey.shade300, width: 1)),
                dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppStyle.grey,
                    border:
                        Border.all(width: 1, color: AppStyle.backgroundcolor)),
                layout: Layout.vertical,
                onCityChanged: (city) {
                  print(cityValue = city.toString());
                  setState(() {
                    cityValue = city.toString();
                  });
                },
                onCountryChanged: (country) {
                  print(countryValue = country.toString());
                  setState(() {
                    countryValue = country.toString();
                  });
                },
                onStateChanged: (state) {
                  print(stateValue = state.toString());
                  setState(() {
                    stateValue = state.toString();
                  });
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll.new(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          AppStyle.backgroundcolor)),
                  onPressed: () {
                    setState(() {
                      address = '$countryValue\n$cityValue\n$stateValue';
                    });
                  },
                  child: Text(
                    'Finish',
                    style: TextStyle(
                        color: AppStyle.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: 30),
              Column(
                children: [
                  Text(
                    address,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: AppStyle.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
