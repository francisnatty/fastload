import 'package:dartz/dartz.dart';
import 'package:fastload/datasource/airtime_datasource.dart';

class AirtimeRepository {
  AirtimeRepository({required this.airtimeDataSource});
  AirtimeDataSource airtimeDataSource;

  Future<Either<String, bool>> buyData(Map<String, dynamic> data) async {
    try {
      final response = await airtimeDataSource.buyAirtime(data);
      print(response.data);
      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(response.statusMessage.toString());
      }
    } catch (e) {
      print(e);
      return Left(e.toString());
    }
  }
}
