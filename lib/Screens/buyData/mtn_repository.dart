import 'dart:convert';

import 'package:fastload/Screens/buyData/model/data_model.dart';
import 'package:http/http.dart' as http;

import '../../global/global_variables.dart';

class MtnRepository {
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
}
