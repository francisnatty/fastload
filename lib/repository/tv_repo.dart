import 'package:dartz/dartz.dart';
import 'package:fastload/Model/tv_model.dart';
import 'package:fastload/datasource/tv_datasource.dart';

class TvRepository {
  TvRepository({required this.tvDataSource});
  TvDataSource tvDataSource;

  Future<Either<String, List<TvModel>>> getAllTvSubs() async {
    try {
      final dstvResponse = await tvDataSource.getDstvSubs();
      final gotvResponse = await tvDataSource.getGoTvSubs();
      final startimesResponse = await tvDataSource.getStartimeSub();
      final showmaxResponse = await tvDataSource.getShowMaxSubs();

      if (dstvResponse.statusCode == 200 ||
          gotvResponse.statusCode == 200 ||
          startimesResponse.statusCode == 200 ||
          showmaxResponse.statusCode == 200) {
        TvModel dstvSubs = TvModel.fromJson(dstvResponse.data['content']);
        TvModel gotvSubs = TvModel.fromJson(gotvResponse.data['content']);
        TvModel startimeSubs =
            TvModel.fromJson(startimesResponse.data['content']);
        TvModel showmaxSubs = TvModel.fromJson(showmaxResponse.data['content']);

        return Right([dstvSubs, gotvSubs, startimeSubs, showmaxSubs]);
      } else {
        return Left(dstvResponse.data);
      }
    } catch (e) {
      print(e);
      return Left(e.toString());
    }
  }
}
