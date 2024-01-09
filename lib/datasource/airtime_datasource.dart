import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fastload/helperFunc/dio_helper.dart';

class AirtimeDataSource {
  Future<Response> buyAirtime(Map<String, dynamic> data) async {
    String url = 'https://sandbox.vtpass.com/api/pay';
    return await DioHelper.postData(url, data);
  }
}
