import 'dart:convert';

import 'package:fastload/buyData/model/data_model.dart';
import 'package:fastload/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../global/global_variables.dart';

class DataAPI {
  Future<ServiceData?> mtnData(BuildContext context) async {
    String baseUrl =
        'https://sandbox.vtpass.com/api/service-variations?serviceID=mtn-data';

    try {
      final response = await http.get(Uri.parse(baseUrl), headers: {
        'Content-Type': 'application/json',
        'api-key': APIKey,
        'secret-key': publicKey,
      });
      final Map<String, dynamic> data = json.decode(response.body);
      return ServiceData.fromJson(data['content']);
    } catch (e) {
      print(e);
      Utils.showSnackBar(context, '${e}');
      return null;
    }
  }

  Future<void> buyData() async {
    String baseUrl = 'https://sandbox.vtpass.com/api/pay';

    final response = http.post(Uri.parse(baseUrl), headers: {
      'Content-Type': 'application/json',
      'api-key': APIKey,
      'secret-key': secretKey,
    });
  }
}
