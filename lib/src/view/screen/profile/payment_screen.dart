import 'package:flutter/material.dart';
import 'package:project2/core/app_style.dart';

import '../../../../core/app_data.dart';
import '../../../models/payment.dart';
import '../../widgets/background_img/background_profile.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundPofile(),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppStyle.backgroundcolor,
          centerTitle: true,
          title: Text('Payment'),
        ),
        body: Padding(
          padding: EdgeInsets.only(right: 20, left: 20, top: 20),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: ListView(
              children: AppData.listPayment.map((e)).toList(),
            ),
          ),
        ),
      ),
    ]);
  }
}

Widget e(Payment payment, {double leftpadding = 20, double rightpadding = 20}) {
  if (payment.tiles.isEmpty) {
    return ListTile(
      subtitle: Text(
        payment.Subtitle,
        style: TextStyle(color: AppStyle.grey),
      ),
      leading: payment.leading,
      contentPadding: EdgeInsets.only(left: leftpadding, right: rightpadding),
      title: Text(
        payment.title.toString(),
        style: TextStyle(color: AppStyle.grey),
      ),
      trailing: Text(
        payment.trailing.toString(),
        style: TextStyle(fontSize: 13, color: AppStyle.grey),
      ),
    );
  }
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: ExpansionTile(
      subtitle: Text(
        payment.Subtitle,
        style: TextStyle(color: AppStyle.grey),
      ),
      /* tilePadding: EdgeInsets.only(left: leftpadding), */
      title: Text(
        payment.title.toString(),
        style: TextStyle(color: AppStyle.grey),
      ),
      children: payment.tiles.map((tile) => e(tile)).toList(),
    ),
  );
}
