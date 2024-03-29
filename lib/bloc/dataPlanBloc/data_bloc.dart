import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fastload/Screens/buyData/model/data_model.dart';
import 'package:fastload/bloc/dataPlanBloc/data_repo.dart';
import 'package:fastload/utils/utils.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final DataRepository dataRepository;

  DataBloc({required this.dataRepository}) : super(DataInitial()) {
    on<FetchDataPlans>((event, emit) => _fetchDataPlans(event, emit));
    add(FetchDataPlans());

    on<BuyData>((event, emit) => _buyData(event, emit));
  }

  void _fetchDataPlans(FetchDataPlans event, Emitter<DataState> emit) async {
    emit(DataLoading());
    final response = await dataRepository.dataPlans();
    response.fold((l) => emit(DataError(error: l)),
        (r) => emit(DataLoaded(dataPlans: r)));
  }

  void _buyData(BuyData event, Emitter<DataState> emit) async {
    fullScreeenLoading(event.context);

    final response = await dataRepository.buyMtnData(event.data);

    Navigator.of(event.context).pop();

    response.fold((l) => showSnackBar(event.context, l),
        (r) => showSnackBar(event.context, 'successful'));
  }
}
