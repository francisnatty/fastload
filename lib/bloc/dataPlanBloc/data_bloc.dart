import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fastload/Screens/buyData/model/data_model.dart';
import 'package:fastload/bloc/dataPlanBloc/mtn_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final MtnRepository mtnRepository;

  DataBloc({required this.mtnRepository}) : super(const DataState()) {
    on<BuyData>((event, emit) async {
      emit(state.copyWith(status: DataStateEnum.buyingData));

      try {
        final buydata = await mtnRepository.buyMtnData(event.serviceId,
            event.variationCode, event.billersCode, event.phoneNum);
        emit(state.copyWith(
          status: DataStateEnum.success,
        ));
      } on SocketException {
        emit(state.copyWith(status: DataStateEnum.socketError));
      } catch (e) {
        emit(state.copyWith(status: DataStateEnum.error, error: state.error));
      }
    });
    on<FetchDataPlans>((event, emit) async {
      emit(state.copyWith(status: DataStateEnum.fetchingData));
      try {
        final data = await mtnRepository.DataPlans();
        emit(state.copyWith(status: DataStateEnum.success, dataPlans: data!));
      } on SocketException {
        emit(state.copyWith(status: DataStateEnum.socketError));
      } catch (e) {
        emit(state.copyWith(status: DataStateEnum.error, error: state.error));
      }
    });
  }

  // void reloadState() {
  //   emit(DataInitial());
  // }
}
