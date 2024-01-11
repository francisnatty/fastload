import 'package:dio/dio.dart';
import 'package:fastload/global/global_variables.dart';

class DioHelper {
  static Future<Response> getData(String path) async {
    Dio dio = Dio();
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'api-key': APIKey,
      'public-key': publicKey,
    };

    return await dio.get(path, options: Options(headers: headers));
  }

  static Future<Response> postData(
      String path, Map<String, dynamic> data) async {
    Dio dio = Dio();
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'api-key': APIKey,
      'secret-key': secretKey,
    };

    return await dio.post(path, data: data, options: Options(headers: headers));
  }
}
