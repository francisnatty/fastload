import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:fastload/global/global_variables.dart';
import 'package:intl/intl.dart';

String formateDateTime() {
  final formatter = DateFormat('yyyyMMddHmm');
  return formatter.format(DateTime.now());
}

class AirtimeAPI {
  static Future<void> purchaseMtnAirtime() async {
    String dateFormat = formateDateTime();
    print(dateFormat);

    try {
      final res = await http.post(Uri.parse(ApiUrl),
          body: jsonEncode(<String, dynamic>{
            'request_id': '$dateFormat}YUs83meikd',
            'serviceID': 'mtn',
            'amount': 1000,
            'phone': 08011111111,
          }),
          headers: {
            'Content-Type': 'application/json',
            'api-key': APIKey,
            'secret-key': secretKey,
          });
      if (res.statusCode == 200) {
        print(res.body);
      } else {
        print('else');
        print(res.body);
      }
    } catch (e) {
      print('error is ${e}');
    }
  }
}
