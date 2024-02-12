// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:fastload/Screens/buyData/model/data_model.dart';
import 'package:fastload/datasource/data_datasource.dart';
import 'package:fastload/utils/api/api_response.dart';
import 'package:fastload/utils/api/list_response.dart';

class DataRepository {
  DataRepository({required this.dataDataSource});
  DataDataSource dataDataSource;

  Future<Either<String, List<ServiceData>>> dataPlans() async {
    try {
      final mtnData = await dataDataSource.getMtnDataPlan();
      final gloData = await dataDataSource.getGloDataPlan();
      final airtelData = await dataDataSource.getAirtelDataPlan();

      final etisalatData = await dataDataSource.getEtisalatDataplan();

      if (mtnData.statusCode == 200 ||
          gloData.statusCode == 200 ||
          airtelData.statusCode == 200 ||
          etisalatData.statusCode == 200) {
        final Map<String, dynamic> mtnDataPlans = mtnData.data;
        final Map<String, dynamic> gloDataPlans = gloData.data;
        final Map<String, dynamic> airtelDataPlans = airtelData.data;
        final Map<String, dynamic> etisalatDataPlans = etisalatData.data;

        ServiceData mtn = ServiceData.fromJson(mtnDataPlans['content']);
        ServiceData glo = ServiceData.fromJson(gloDataPlans['content']);
        ServiceData airtel = ServiceData.fromJson(airtelDataPlans['content']);
        ServiceData etisalat =
            ServiceData.fromJson(etisalatDataPlans['content']);

        return Right([mtn, glo, airtel, etisalat]);
      } else {
        return Left(mtnData.statusMessage.toString());
      }
    } catch (e) {
      print(e);
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> buyMtnData(Map<String, dynamic> data) async {
    try {
      final response = await dataDataSource.purchaseData(data);
      print(response.data);

      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(response.statusMessage.toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}

abstract class RemoteDataSource {
  Future<ApiResponse<ListResponse<ServiceData>>> getMovies();
  // Future<ApiResponse<g>>
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiClient apiClient;
  RemoteDataSourceImpl({
    required this.apiClient,
  });

  @override
  Future<ApiResponse<ListResponse<ServiceData>>> getMovies() {
    return apiClient.request(
      path: '/service-variations?serviceID=airtel-data',
      method: MethodType.get,
      fromJson: (json) => ListResponse.fromJson(
          json, (json) => ServiceData.fromJson(json as Map<String, dynamic>)),
    );
  }
}
