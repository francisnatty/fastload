import 'dart:convert';
import 'dart:io';

import '../../global/global_variables.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<String> generateAccessToken() async {
    String sandboxUrl = "https://sandbox.monnify.com";
    try {
      final res =
          await http.post(Uri.parse('$sandboxUrl/api/v1/auth/login'), headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$monnifyApikey:$monnifySecretKey'))}'
      });

      var responseData = json.decode(res.body);
      var accessToken = responseData['responseBody']['accessToken'];

      return accessToken;
    } on SocketException {
      return '';
    } catch (e) {
      return '';
    }
  }
}
