import 'package:flutter/material.dart';
import 'package:project2/src/models/address.dart';
import 'package:project2/src/view/widgets/background_img/background_profile.dart';

import '../../../../core/app_data.dart';
import '../../../../core/app_style.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundPofile(),
      Scaffold(
        appBar: AppBar(
          title: Text('Address'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppStyle.backgroundcolor,
        ),
        backgroundColor: Colors.transparent,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: AppData.listAddres.map((widget)).toList(),
        ),
      ),
    ]);
  }
}

Widget widget(Address addres) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 3.0,
            offset: Offset(0.0, 0.50),
          )
        ],
      ),
      height: 150,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppStyle.grey.withOpacity(0.2),
        ),
        child: Padding(
          padding: EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                addres.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppStyle.backgroundcolor),
              ),
              SizedBox(height: 10),
              Text(
                addres.addrs,
                style: TextStyle(fontSize: 13, color: AppStyle.grey),
              ),
              SizedBox(height: 10),
              Text(
                addres.no,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppStyle.white),
              ),
              SizedBox(height: 10),
              Text(
                addres.ig,
                style: TextStyle(color: AppStyle.grey),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
