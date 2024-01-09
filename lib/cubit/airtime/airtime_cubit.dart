import 'package:equatable/equatable.dart';
import 'package:fastload/repository/airtime_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'airtime_state.dart';

class AirtimeCubit extends Cubit<AirtimeState> {
  AirtimeRepository airtimeRepository;
  AirtimeCubit({required this.airtimeRepository}) : super(BuyAirtimeInitial());

  void buyData(Map<String, dynamic> data) async {
    emit(BuyAirtimeLoading());
    final response = await airtimeRepository.buyData(data);

    response.fold(
        (l) => emit(BuyAirtimeError(error: l)), (r) => BuyAirtimeSucess());
  }
}
