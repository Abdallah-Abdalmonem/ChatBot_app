import 'dart:convert';

import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
          headers: {'Content-Type': 'application/json'}),
    );
  }

  //method url
  Future<Response>? getData({
    required String path,
    required map,
  }) async {
    return await dio!.get(
      path,
      queryParameters: map,
    );
  }

 static Map<String, dynamic> b = {
    "email": "mohamedhessan139@gmail.com",
    "password": '123456',
  };
  static Future<Response>? postData({
    required String path,
    // Map<String , dynamic>?  map,
    required Map<String, dynamic> data,
  }) async {
    return await dio!.post(
      path,
      // queryParameters: map,
      data:b ,
    );
  }
}
