import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fastload/Screens/buyData/model/data_model.dart';
import 'package:fastload/bloc/dataPlanBloc/mtn_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final DataRepository dataRepository;

  DataBloc({required this.dataRepository}) : super(const DataState()) {
    on<BuyData>((event, emit) async {
      emit(state.copyWith(status: DataStateEnum.buyingData));

      try {
        final buydata = await dataRepository.buyMtnData(event.serviceId,
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

    on<FetchDataPlans>(
      (event, emit) async {
        // emit(state.copyWith(status: DataStateEnum.fetchingData));
        try {
          final mtndata = await dataRepository.DataPlans();
          final airtelData = await dataRepository.AirtelDataPlan();
          final gloData = await dataRepository.GloDataPlans();

          List<ServiceData> allNetworks = [mtndata!, airtelData!, gloData!];

          emit(state.copyWith(
              status: DataStateEnum.success, allNetworks: allNetworks));
        } on SocketException {
          emit(state.copyWith(status: DataStateEnum.socketError));
        } catch (e) {
          emit(state.copyWith(status: DataStateEnum.error, error: state.error));
        }
      },
    );
  }

  // void reloadState() {
  //   emit(DataInitial());
  // }
}
