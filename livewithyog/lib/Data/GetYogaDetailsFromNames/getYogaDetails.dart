import 'dart:convert';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:livewithyog/Data/GetRandomPose/getRandomYoga.dart';

import 'package:livewithyog/Data/Models/yogaModel.dart';

class getYogaDetails {
  final String baseUrl = 'https://yoga-api-nzy4.onrender.com/v1/poses';

  Future<Yoga> fetchDetails(String poseName) async {
    final response = await http.get(Uri.parse('$baseUrl?name=$poseName'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return Yoga.fromJson(responseData);
    } else {
      throw Exception('Failed to fetch yoga pose details');
    }
  }

  Future<List<Yoga>> fetchYogaPosesDetails(BuildContext context) async {
    YogaPoseService service = new YogaPoseService();

    List<String> poseNames = await service.fetchYogaPoses();
    List<Yoga> yogaPoses = [];
    for (var poseName in poseNames) {
      try {
        Yoga poseDetails = await fetchDetails(poseName);
        yogaPoses.add(poseDetails);
      } catch (e) {
        print('Error fetching details for $poseName: $e');
      }
    }
    return yogaPoses;
  }
}
