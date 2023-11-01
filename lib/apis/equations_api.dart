import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/equations.dart';
import '../models/scanned.dart';

class EquationsApi {
  static String server =
      'f037-2a02-1810-141f-ef00-5d0e-71b6-84e8-dd85.ngrok-free.app';

  static Future<List<Available>> fetchAvailable() async {
    var headers = <String, String>{
      'ngrok-skip-browser-warning': 'true',
      // or 'User-Agent': 'your_custom_user_agent',
    };

    var url = Uri.https(server, '/available');

    final response = await http.get(
      url,
      headers: headers,
    );

    print('Response: ${response.statusCode}');

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((available) => Available.fromJson(available))
          .toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  static Future<List<Scanned>> fetchScanned() async {
    var headers = <String, String>{
      'ngrok-skip-browser-warning': 'true',
      // or 'User-Agent': 'your_custom_user_agent',
    };

    var url = Uri.https(server, '/scanned');

    final response = await http.get(
      url,
      headers: headers,
    );

    print('Response: ${response.statusCode}');

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((scanned) => Scanned.fromJson(scanned)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
