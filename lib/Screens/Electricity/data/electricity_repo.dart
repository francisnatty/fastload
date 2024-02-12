// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fastload/Screens/Electricity/data/electricity_dataSource.dart';
import 'package:fastload/Screens/Electricity/model.dart/verifycard_reponse.dart';

class ElectricityRepository {
  ElectricityDataSource electricityDataSource;
  ElectricityRepository({
    required this.electricityDataSource,
  });

  Future<Either<String, VerifyCardResponse>> verifyMeterNumber(
      {required int meterNum,
      required String serviceId,
      required String type}) async {
    Map<String, dynamic> meterDetails = {
      'billersCode': meterNum,
      'serviceID': serviceId,
      'type': type,
    };

    try {
      final response =
          await electricityDataSource.veriftyMeterNumber(meterDetails);

      if (response.statusCode == 200) {
        print(response.data);
        Map<String, dynamic> json = response.data;
        return Right(VerifyCardResponse.fromMap(json));
      } else {
        return Left(response.statusMessage.toString());
      }
    } catch (e) {
      print(e.toString());
      return Left(e.toString());
    }
  }
}
