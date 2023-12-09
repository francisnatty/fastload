import 'dart:convert';

import 'package:fastload/Screens/buyData/model/data_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../global/global_variables.dart';

class DataRepository {
  String formateDateTime() {
    final formatter = DateFormat('yyyyMMddHmm');
    return formatter.format(DateTime.now());
  }

  Future<ServiceData?> DataPlans() async {
    String baseUrl =
        'https://sandbox.vtpass.com/api/service-variations?serviceID=mtn-data';

    final response = await http.get(Uri.parse(baseUrl), headers: {
      'Content-Type': 'application/json',
      'api-key': APIKey,
      'secret-key': publicKey,
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return ServiceData.fromJson(data['content']);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<ServiceData?> GloDataPlans() async {
    String baseUrl =
        'https://sandbox.vtpass.com/api/service-variations?serviceID=glo-data';

    final response = await http.get(Uri.parse(baseUrl), headers: {
      'Content-Type': 'application/json',
      'api-key': APIKey,
      'secret-key': publicKey,
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return ServiceData.fromJson(data['content']);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<ServiceData?> AirtelDataPlan() async {
    String baseUrl =
        'https://sandbox.vtpass.com/api/service-variations?serviceID=glo-data';

    final response = await http.get(Uri.parse(baseUrl), headers: {
      'Content-Type': 'application/json',
      'api-key': APIKey,
      'secret-key': publicKey,
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return ServiceData.fromJson(data['content']);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<void> buyMtnData(String serviceId, String variationCode,
      int billersCode, int phone) async {
    String baseUrl = 'https://sandbox.vtpass.com/api/pay';
    String dateFormat = formateDateTime();
    String date = DateTime.now().toString();
    String date2 = DateTime.timestamp().toString();

    try {
      final response = await http.post(Uri.parse(baseUrl),
          headers: {
            'Content-Type': 'application/json',
            'api-key': APIKey,
            'secret-key': secretKey,
          },
          body: jsonEncode(<String, dynamic>{
            'request_id': dateFormat,
            'serviceID': serviceId,
            'billersCode': billersCode,
            'variation_code': variationCode,
            'phone': phone,
          }));

      if (response.statusCode == 200) {
        // print(response.body);
      } else {
        //print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
