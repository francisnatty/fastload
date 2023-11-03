import 'dart:convert';

import 'package:fastload/Screens/TvSub/model/tv_model.dart';
import 'package:fastload/global/global_variables.dart';
import 'package:http/http.dart' as http;

class TvApi {
  String baseUrl =
      'https://sandbox.vtpass.com/api/service-variations?serviceID=dstv';
  Future<TvModel?> getAllSubs() async {
    try {
      final response = await http.get(Uri.parse(baseUrl), headers: {
        'Content-Type': 'application/json',
        'api-key': APIKey,
        'secret-key': publicKey
      });
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return TvModel.fromJson(data['content']);
      }
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }
}
