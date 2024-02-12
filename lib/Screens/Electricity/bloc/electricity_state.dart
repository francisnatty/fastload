// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:fastload/Screens/Electricity/model.dart/verifycard_reponse.dart';

enum ElectricityStatus { initial, success, error }

abstract class ElectricityEvent extends Equatable {}

class VerifyMeterNumber extends ElectricityEvent {
  final int meterNum;
  final String serviceId;
  final String type;
  VerifyMeterNumber({
    required this.meterNum,
    required this.serviceId,
    required this.type,
  });

  @override
  List<Object?> get props => [meterNum, serviceId, type];
}

class ElectricityState extends Equatable {
  final String? error;
  final VerifyCardResponse? verifyCardResponse;
  final ElectricityStatus status;

  const ElectricityState({
    this.error,
    this.verifyCardResponse,
    required this.status,
  });

  @override
  List<Object?> get props => [];

  ElectricityState copyWith({
    String? error,
    VerifyCardResponse? verifyCardResponse,
    ElectricityStatus? status,
  }) {
    return ElectricityState(
      error: error ?? this.error,
      verifyCardResponse: verifyCardResponse ?? this.verifyCardResponse,
      status: status ?? this.status,
    );
  }
}
