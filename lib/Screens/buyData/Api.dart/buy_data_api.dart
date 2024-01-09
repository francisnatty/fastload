import 'dart:convert';
import 'dart:io';

import 'package:fastload/Screens/buyData/model/data_model.dart';
import 'package:fastload/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../global/global_variables.dart';

class DataAPI {
  String formateDateTime() {
    final formatter = DateFormat('yyyyMMddHmm');
    return formatter.format(DateTime.now());
  }

  Future<ServiceData?> getMtnDataPlans(
      BuildContext context, String serviceId) async {
    String baseUrl =
        'https://sandbox.vtpass.com/api/service-variations?serviceID=$serviceId';

    try {
      final response = await http.get(Uri.parse(baseUrl), headers: {
        'Content-Type': 'application/json',
        'api-key': APIKey,
        'secret-key': publicKey,
      });
      final Map<String, dynamic> data = json.decode(response.body);
      return ServiceData.fromJson(data['content']);
    } on SocketException {
      showSnackBar(context, 'Little or no Internet Connection');
    } catch (e) {
      showSnackBar(context, '$e');
      return null;
    }
    return null;
  }

  Future<void> buyMtnData(BuildContext context, String serviceId,
      String variationCode, String billersCode, int phone) async {
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
        print(response.body);
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
      showSnackBar(context, '$e');
    }
  }
}
