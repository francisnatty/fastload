import 'dart:convert';
import 'dart:io';

import 'package:fastload/global/global_variables.dart';
import 'package:http/http.dart' as http;

class BankRepository {
  Future<void> requestBankAcct() async {
    String baseUrl = "https://sandbox.monnify.com";
    final accessToken = await generateAccessToken();
    final res = await http.post(
        Uri.parse('$baseUrl/api/v1/bank-transfer/reserved-accounts'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'bearer $accessToken'
        },
        body: jsonEncode(<String, dynamic>{
          "contractCode": "8862750303",
          "accountName": "Francis Nathaniel",
          "currencyCode": "NGN",
          "accountReference": "francisnatty247",
          "customerEmail": "fnathaneil929@gmail.com",
          "customerName": "Francis Nathaniel",
          "reservedAccountType": "INVOICE"
        }));

    print(res.body);
  }

  Future<String> generateAccessToken() async {
    String sandboxUrl = "https://sandbox.monnify.com";
    try {
      final res = await http
          .post(Uri.parse('$sandboxUrl/api/v1/auth/login'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Basic ${base64Encode(utf8.encode('$monnifyApikey:$monnifySecretKey'))}'
      });

      var responseData = json.decode(res.body);
      var accessToken = responseData['responseBody']['accessToken'];

      return accessToken;
    } on SocketException {
      return '';
    } catch (e) {
      return '';
    }
    // print(res.body);
  }
}
