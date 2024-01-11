import 'dart:convert';

import 'package:dio/dio.dart';

import '../global/global_variables.dart';

class BankAcctDataSource {
  Future<Response> generate() async {
    Dio dio = Dio();
    String url = "https://sandbox.monnify.com";
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Basic ${base64Encode(utf8.encode('$monnifyApikey:$monnifySecretKey'))}'
    };

    return await dio.post(url, options: Options(headers: headers));
  }
}
