import 'package:flutter/material.dart';
import 'package:project2/src/controller/togleC.dart';
import 'package:get/get.dart';

class Togle extends StatelessWidget {
  final TogleC c = Get.put(TogleC());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => TextField(
                  obscureText: c.ishiden.value,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () => c.ishiden.toggle(),
                          icon: Icon(Icons.remove_red_eye)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                )),
          ],
        ),
      ),
    );
  }
}
