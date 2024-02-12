import 'dart:math';

import 'package:fastload/Screens/Electricity/bloc/electricity_state.dart';
import 'package:fastload/Screens/Electricity/data/electricity_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElectricityBloc extends Bloc<ElectricityEvent, ElectricityState> {
  ElectricityRepository electricityRepository;

  ElectricityBloc({required this.electricityRepository})
      : super(const ElectricityState(status: ElectricityStatus.initial)) {
    on<VerifyMeterNumber>((event, emit) => _verifyMeterNumber(event, emit));
  }

  void _verifyMeterNumber(
      VerifyMeterNumber event, Emitter<ElectricityState> emit) async {
    final response = await electricityRepository.verifyMeterNumber(
      meterNum: event.meterNum,
      serviceId: event.serviceId,
      type: event.type,
    );

    response.fold((l) {
      debugPrint(l);
    }, (r) {
      debugPrint(r.content.toString());
    });
  }
}
