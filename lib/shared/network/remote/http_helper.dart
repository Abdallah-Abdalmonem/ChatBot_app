import 'dart:convert';

import 'package:http/http.dart' as http;

class Http {
  
  static Future getposts({
    required String accessToken,
  }) async {
    Uri uri = Uri.parse(
        'https://graph.facebook.com/me?fields=posts&access_token=$accessToken');

    var response = await http.get(uri);
    var responseBody = jsonDecode(response.body);
    
    return responseBody;
  }

   static Future getNumComment({
    required String accessToken,
     required String postId,
  }) async {
    Uri uri = Uri.parse(
        'https://graph.facebook.com/v12.0/$postId/comments?summary=1&access_token=$accessToken');

    var response = await http.get(uri);
    var responseBody = jsonDecode(response.body);
    
    return responseBody;
  }

  static Future getComment({
    required String accessToken,
    required String postId,
  }) async {
    Uri uri = Uri.parse(
        'https://graph.facebook.com/v12.0/$postId/comments?access_token=$accessToken');

    var response = await http.get(uri);
    var responseBody = jsonDecode(response.body);

    return responseBody;
  }


}


//https://graph.facebook.com/v12.0/113400945051600_114854861572261/comments?summary=1&access_token=EAAJs0OWZCy6YBAMFhzOxeKB38wbVKlTYQD2zkuB5GUyzLFLVUC5XRYmwjorvj2U5TOMNy5DLOKwrYqtCZB9DNZCgUGkHBuyMyP8aIWo1xjakEbdFLfiQbeIwYFTQqXFEQBtbHgHXgHMHCk5UpmMyKNq1GuKvosEdl6XgtZCndmZBEZAQCkqZCu46VzTnpHsJglTNe5yQY0MskONt0uQ7Mon