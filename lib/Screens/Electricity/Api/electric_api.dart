import 'dart:convert';

import 'package:fastload/global/global_variables.dart';
import 'package:http/http.dart' as http;

class ElectricityApi {
  Future<bool?> validateMeterNumber() async {
    String baseUrl = 'https://api-service.vtpass.com/api/merchant-verify';
    try {
      final response = await http.post(Uri.parse(baseUrl),
          headers: {
            'Content-Type': 'application/json',
            'api-key': APIKey,
            'secret-key': secretKey,
          },
          body: jsonEncode(<String, dynamic>{
            'billersCode': 37143702944,
            'serviceID': 'kaduna-electric',
            'type': 'prepaid'
          }));
      if (response.statusCode == 200) {
        print(response.body);
        return true;
      } else {
        print('else');
        print(response.body);
        return false;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
