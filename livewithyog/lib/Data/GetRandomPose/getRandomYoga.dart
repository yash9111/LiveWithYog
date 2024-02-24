import 'dart:convert';
import 'package:http/http.dart' as http;

class YogaPoseService {
  
  Future<List<String>> fetchYogaPoses() async {
    final url = Uri.parse('https://yogserver.onrender.com/randomPose');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> poses = data['poses'];

        List<String> poseNames = [];
        for (var pose in poses) {
          poseNames.add(pose.toString());
          print(pose);
        }

        return poseNames;
      } else {
        throw Exception('Failed to load poses');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }
}


