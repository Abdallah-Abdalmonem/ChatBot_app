import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  // get method
  Future<dynamic> get({required String accessToken}) async {
    http.Response response = await http.get(Uri.parse(
        'https://graph.facebook.com/me?fields=posts{full_picture,message,created_time}&access_token=$accessToken'));

    print('@@@@@@@@@@@@@@@@@${response.body}');
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception('The Request failed with status: ${response.statusCode}');
    }
  }


    Future<dynamic> getcommenttest({required String accessToken}) async {
    http.Response response = await http.get(Uri.parse(
        'https://graph.facebook.com/me?fields=posts{full_picture,message,created_time}&access_token=$accessToken'));

    print('@@@@@@@@@@@@@@@@@${response.body}');
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception('The Request failed with status: ${response.statusCode}');
    }
  }
}
