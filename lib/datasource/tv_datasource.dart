import 'package:dio/dio.dart';
import 'package:fastload/helperFunc/dio_helper.dart';

class TvDataSource {
  Future<Response> getDstvSubs() async {
    String url =
        'https://sandbox.vtpass.com/api/service-variations?serviceID=dstv';
    return await DioHelper.getData(url);
  }

  Future<Response> getGoTvSubs() async {
    String url =
        'https://sandbox.vtpass.com/api/service-variations?serviceID=gotv';

    return await DioHelper.getData(url);
  }

  Future<Response> getStartimeSub() async {
    String url =
        'https://sandbox.vtpass.com/api/service-variations?serviceID=startimes';

    return await DioHelper.getData(url);
  }

  Future<Response> getShowMaxSubs() async {
    String url =
        'https://sandbox.vtpass.com/api/service-variations?serviceID=showmax';

    return await DioHelper.getData(url);
  }

  Future<Response> verifyDstvCard(Map<String, dynamic> data) async {
    print(data);
    String url = 'https://sandbox.vtpass.com/api/merchant-verify';

    return await DioHelper.postData(url, data);
  }
}
