import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/equations.dart';

class EquationsApi {
  static String server = 'e61f-2a02-1810-141f-ef00-5d0e-71b6-84e8-dd85.ngrok-free.app';
  
  static Future<List<User>> fetchUsers() async {
    var headers = <String, String>{
      'ngrok-skip-browser-warning': 'true',
      // or 'User-Agent': 'your_custom_user_agent',
    };

    var url = Uri.https(server, '/users');

    final response = await http.get(
      url,
      headers: headers,
    );

    print('Response: ${response.statusCode}');

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
