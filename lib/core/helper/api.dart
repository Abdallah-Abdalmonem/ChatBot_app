import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  // get method
  Future<Map<String, dynamic>> getPosts({required String accessToken}) async {
    http.Response response = await http.get(Uri.parse(
        'https://graph.facebook.com/me?fields=posts{message,created_time,permalink_url,comments}&access_token=$accessToken'));

    print('api @@@@@@@${response.body}');
    if (response.statusCode == 200) {
      return await jsonDecode(response.body);
    } else {
      throw Exception('The Request failed with status: ${response.statusCode}');
    }
  }
}
