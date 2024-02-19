// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:http/http.dart' as http;

void main() async {
/*   Uri url = Uri.parse('https://api.rajaongkir.com/starter/province');
  final res =
      await http.get(url, headers: {'key': '2fc6ac37fbeffe65ce3854ad828b6841'});
  /* print((json.decode(res.body) as Map<String, dynamic>)['data']); */
  print(res.body); */
  final response = await http.get(
      Uri.parse('http://localhost:14118/DD_Jodoh_Adam.aspx'),
      headers: {'Authorization': 'Basic bW9sb25fZ2FiZTptb2xvbmdhYmUyMDIy'});
  print(response.body);
/*   var res = await Dio().get(
      'https://dev.bangsatangiawan.com/MOLON_GABE/DD_Komoditas.aspx',
      queryParameters: {
        'Authorization': 'Basic bW9sb25fZ2FiZTptb2xvbmdhYmUyMDIy'
      });
  print(res.data); */
}
