import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:fastload/Screens/buyData/mtn_repository.dart';
import 'package:fastload/cubit/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final MtnRepository mtnRepository;
  DataBloc({required this.mtnRepository}) : super(DataInitial()) {
    on<DataEvent>((event, emit) async {
      emit(DataLoading());
      try {
        final data = await mtnRepository.DataPlans();
        emit(DataLoaded(dataPlans: data!));
      } on SocketException {
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
