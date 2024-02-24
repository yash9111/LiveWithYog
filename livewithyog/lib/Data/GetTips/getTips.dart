import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> getTips() async {
  String randomTip;
  final response = await http.get(Uri.parse('https://yogserver.onrender.com/tips/random-tip'));
  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);
    randomTip = responseData['tip'];
  } else {
    throw Exception('Failed to load random tip');
  }

  return randomTip;
}
