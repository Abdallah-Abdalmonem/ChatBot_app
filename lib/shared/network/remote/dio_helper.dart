import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
          // baseUrl: 'graph.facebook.com/',
          receiveDataWhenStatusError: true,
          headers: {'Content-Type': 'application/json'}),
    );
  }

  //method url
  static Future<Response>? getData({
    required String accessToken,
  }) async {
    return await dio!.get(
      'https://graph.facebook.com/me?',
      queryParameters: {
        'access_token': accessToken,
        'fields': 'id,name,posts{comments{id,message}}',
      },
    ).then((value) => value);
  }

// function to get posts from the Facebook API
  static Future<List<dynamic>> getPosts({required String accessToken}) async {
    final response = await dio!.get(
      'https://graph.facebook.com/me/posts',
      queryParameters: {
        'access_token': accessToken,
        'fields': 'id,message,created_time',
      },
    );
    if (response.statusCode == 200) {
      return response.data['data'];
    } else {
      throw Exception('Failed to get posts from the Facebook API');
    }
  }

  // function to get comments for a post from the Facebook API
  static Future<List<dynamic>> getCommentsFromPost({
    required String postId,
    required String accessToken,
  }) async {
    final response = await dio!.get(
      'https://graph.facebook.com/$postId/comments',
      queryParameters: {
        'access_token': accessToken,
        'fields': 'id,message,created_time,from{name,picture}',
      },
    );
    if (response.statusCode == 200) {
      return response.data['data'];
    } else {
      throw Exception('Failed to get comments for post from the Facebook API');
    }
  }

  static Future<Response>? postData({
    required String path,
    // Map<String , dynamic>?  map,
    required Map<String, dynamic> data,
  }) async {
    return await dio!.post(
      path,
      // queryParameters: map,
      data: data,
    );
  }
}


//https://graph.facebook.com/me?fields=id,name,posts{comments{id,message}}&access_token=EAAJs0OWZCy6YBAMjOBZBbvmMQbKFFCZCZApqvyEQyrOagXqJxW7UotsRJ4eacY4WL6t6XESUKlw1i3hwdgrMoRcZBWHF7ZADYrmZBcpLgxqdRbDdDqHATbvATpx5devwTWNLvMTPTjWPpvUl8IFtLcmQHFnE4ZBZBPsvAPEq0XjyPTDggfOsKWxEd3lFe4TyJlDbr95aqz6zvFaEey4zlo73x