import 'dart:async';

import 'package:dio/dio.dart';

BaseOptions options = new BaseOptions(
  baseUrl: "http://192.168.1.35:8001/",
  connectTimeout: 5000,
  receiveTimeout: 3000,
);
var dio = new Dio(options);

class NetUtils {
  ///get请求
  static Future get(String url, {Map<String, dynamic> params}) async {
    var response = await dio.get(url, queryParameters: params);
    return response;
  }

  ///post请求
  static Future post(String url, {Map<String, dynamic> params}) async {
    var response = await dio.post(url, data: params);
    return response;
  }
}
