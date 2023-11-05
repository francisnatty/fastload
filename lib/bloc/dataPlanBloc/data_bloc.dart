import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:fastload/Screens/buyData/model/data_model.dart';
import 'package:fastload/bloc/dataPlanBloc/mtn_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final MtnRepository mtnRepository;

  DataBloc({required this.mtnRepository}) : super(DataInitial()) {
    on<BuyData>((event, emit) {
      emit(BuyDataLoading());
      print('loading');

      try {
        final buydata = mtnRepository.buyMtnData(event.serviceId,
            event.variationCode, event.billersCode, event.phoneNum);
      } on SocketException {
        emit(BuyDataSocketError());
      } catch (e) {
        emit(BuyDataError(error: e.toString()));
      }
    });
    on<DataEvent>((event, emit) async {
      emit(DataLoading());
      try {
        final data = await mtnRepository.DataPlans();
        emit(DataLoaded(dataPlans: data!));
      } on SocketException {
        print('socket error');
        emit(DataSocketError());
      } catch (e) {
        emit(DataError(error: e.toString()));
      }
    });
  }

  void reloadState() {
    emit(DataInitial());
  }
}
