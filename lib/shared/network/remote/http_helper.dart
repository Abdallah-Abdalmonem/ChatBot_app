import 'dart:convert';

import 'package:http/http.dart' as http;

class Http {
  static Future getposts({
    required String accessToken,
  }) async {
    Uri uri = Uri.parse(
        'https://graph.facebook.com/me?fields=posts{full_picture,message,created_time}&access_token=$accessToken');

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

    return responseBody['summary']['total_count'];
  }

  static Future getComment({
    required String accessToken,
    required String postId,
  }) async {
    Uri uri = Uri.parse(
        'https://graph.facebook.com/v12.0/$postId?fields=comments{from,message,id,is_hidden}&access_token=$accessToken');

    var response = await http.get(uri);
    var responseBody = jsonDecode(response.body);

    return responseBody;
  }

  static addCommentForComment({
    required String message,
    required String commentId,
    required String accessToken,
  }) async {
    final String url =
        "https://graph.facebook.com/$commentId/comments?access_token=$accessToken";
    final Map<String, String> headers = {"Content-Type": "application/json"};
    final Map<String, String> body = {"message": message};
    var response = await http.post(Uri.parse(url),
        headers: headers, 
        body: jsonEncode(body));
    final dynamic data = jsonDecode(response.body);
    
  }

  static  hideComment({required String commentId,required String accessToken}) async {
    final String url = 'https://graph.facebook.com/v12.0/$commentId';

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> body = {
      'is_hidden': true,
      'access_token': accessToken,
    };

    final http.Response response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      print('Comment with ID $commentId has been hidden.');
    } else {
      print(
          'Failed to hide comment with ID $commentId. Response: ${response.body}');
    }
  }

  void createPostWithImage(String pageId, String accessToken, String message, String imagePath) async {
  final String url = 'https://graph.facebook.com/v12.0/$pageId/photos';
  final http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(url))
    ..fields['message'] = message
    ..fields['access_token'] = accessToken
    ..files.add(await http.MultipartFile.fromPath('source', imagePath));

  final http.StreamedResponse response = await request.send();
  final dynamic data = await response.stream.bytesToString();
  print(data);
}
}


//https://graph.facebook.com/v12.0/113400945051600_114854861572261/comments?summary=1&access_token=EAAJs0OWZCy6YBAMFhzOxeKB38wbVKlTYQD2zkuB5GUyzLFLVUC5XRYmwjorvj2U5TOMNy5DLOKwrYqtCZB9DNZCgUGkHBuyMyP8aIWo1xjakEbdFLfiQbeIwYFTQqXFEQBtbHgHXgHMHCk5UpmMyKNq1GuKvosEdl6XgtZCndmZBEZAQCkqZCu46VzTnpHsJglTNe5yQY0MskONt0uQ7Mon