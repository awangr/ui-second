import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MolonWidget extends StatelessWidget {
  MolonWidget({super.key});
  final MolonC c = Get.put(MolonC());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              c.gethttp();
            },
            child: Text('PRESS')),
      ),
    );
  }
}

class MolonC extends GetxController {
  void gethttp() async {

    final response = await http.get(
        Uri.parse(
            'https://cors-anywhere.herokuapp.com/http://192.168.20.2:14118/DD_Jodoh_Adam.aspx'),
        headers: {'Authorization': 'Basic bW9sb25fZ2FiZTptb2xvbmdhYmUyMDIy'});
    print(response.body);
/*   var res = await Dio().get(
      'https://dev.bangsatangiawan.com/MOLON_GABE/DD_Komoditas.aspx',
      queryParameters: {
        'Authorization': 'Basic bW9sb25fZ2FiZTptb2xvbmdhYmUyMDIy'
      });
  print(res.data); */
  }
}
