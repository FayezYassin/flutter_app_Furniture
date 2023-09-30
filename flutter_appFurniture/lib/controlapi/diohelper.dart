import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static intidio() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com/',
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getdata(
      {required String url, Map<String, dynamic>? qury}) async {
    return await dio!.get(url, queryParameters: qury);
  }

  static Future<Response> postdata(
      {required String url,
      Map<String, dynamic>? qury,
      required Map<String, dynamic> data}) async {
    return await dio!.post(url, queryParameters: qury, data: data);
  }
}
//c
