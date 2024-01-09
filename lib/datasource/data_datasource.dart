import 'package:dio/dio.dart';
import 'package:fastload/helperFunc/dio_helper.dart';

class DataDataSource {
  Future<Response> getMtnDataPlan() async {
    String baseUrl =
        'https://sandbox.vtpass.com/api/service-variations?serviceID=mtn-data';
    return await DioHelper.getData(baseUrl);
  }

  Future<Response> getAirtelDataPlan() async {
    String baseUrl =
        'https://sandbox.vtpass.com/api/service-variations?serviceID=airtel-data';

    return await DioHelper.getData(baseUrl);
  }

  Future<Response> getGloDataPlan() async {
    String baseUrl =
        'https://sandbox.vtpass.com/api/service-variations?serviceID=glo-data';
    return await DioHelper.getData(baseUrl);
  }

  Future<Response> getEtisalatDataplan() async {
    String baseUrl =
        'https://sandbox.vtpass.com/api/service-variations?serviceID=etisalat-data';
    return await DioHelper.getData(baseUrl);
  }

  Future<Response> purchaseData(Map<String, dynamic> data) async {
    String baseUrl = 'https://sandbox.vtpass.com/api/pay';

    return await DioHelper.postData(baseUrl, data);
  }
}
