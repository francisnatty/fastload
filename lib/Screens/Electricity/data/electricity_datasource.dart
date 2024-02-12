import 'package:dio/dio.dart';
import 'package:fastload/global/global_variables.dart';
import 'package:fastload/helperFunc/dio_helper.dart';

class ElectricityDataSource {
  Future<Response> veriftyMeterNumber(Map<String, dynamic> meterDetails) async {
    return await DioHelper.postData('$apiUrl/merchant-verify', meterDetails);
  }
}
