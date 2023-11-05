import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/equations.dart';
import '../models/scanned.dart';

class EquationsApi {
  static String server =
      '4431-2a02-1810-141f-ef00-f13f-8ebc-e524-660f.ngrok-free.app';
  static var headers = <String, String>{
    'ngrok-skip-browser-warning': 'true',
  };

  static Future<List<Available>> fetchAvailable() async {
    var url = Uri.https(server, '/available');

    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((available) => Available.fromJson(available))
          .toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  static Future<Available> updateEquation(int id, Available equation) async {
    var url = Uri.https(server, '/available/$id');

    final http.Response response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(equation.toJson()),
    );
    if (response.statusCode == 200) {
      return Available.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update equation');
    }
  }

  static Future deleteEquation(int id) async {
    var url = Uri.https(server, '/available/$id');

    final http.Response response = await http.delete(url);
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete equation');
    }
  }

  static Future<List<Scanned>> fetchScanned() async {
    var url = Uri.https(server, '/scanned');
    print(url);
    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((scanned) => Scanned.fromJson(scanned)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
