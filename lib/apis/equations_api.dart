import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/equations.dart';
import '../models/scanned.dart';

class EquationsApi {
  static String server =
      '9cf2-2a02-1810-141f-ef00-f13f-8ebc-e524-660f.ngrok-free.app';
  static var headers = <String, String>{
    'ngrok-skip-browser-warning': 'true',
  };

  static Future<List<Available>> fetchAvailable() async {
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
    var url = Uri.https(server, '/scanned');
    print(url);
    final response = await http. get(
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
