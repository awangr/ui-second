import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Uniq extends StatelessWidget {
  const Uniq({super.key});

  @override
  Widget build(BuildContext context) {
    final uniqC = Get.put(UniqC());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<UniqC>(
              id: 'jono',
              builder: (_) {
                return Text(
                  'Number ${uniqC.count} ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                );
              }),
          GetBuilder<UniqC>(
              id: 'joni',
              builder: (_) {
                return Text(
                  'Number ${uniqC.count} ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                );
              }),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () => uniqC.remove(),
                  icon: Icon(Icons.remove, size: 20)),
              IconButton(
                  onPressed: () => uniqC.add(), icon: Icon(Icons.add, size: 20))
            ],
          )
        ],
      ),
    );
  }
}

class UniqC extends GetxController {
  var count = 0;
  void add() {
    count++;

    //in () this is the uniq code
    update(['jono']);
  }

  void remove() {
    count--;

    //in () this is the uniq code
    update(['jono']);
  }
}
