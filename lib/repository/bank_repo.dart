import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:fastload/helperFunc/network/network_helper.dart';
import 'package:http/http.dart' as http;

class BankRepository {
  Future<void> requestBankAcct() async {
    String baseUrl = "https://sandbox.monnify.com";
    final accessToken = await NetworkHelper().generateAccessToken();
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

    // print(res.statusCode);
    log(res.statusCode.toString());
    log(res.body);
  }
}
