part of 'data_bloc.dart';

abstract class DataEvent {}

class FetchDataPlans extends DataEvent {}

class BuyData extends DataEvent {
  final String serviceId;
  final String variationCode;
  final int billersCode;
  final int phoneNum;
  BuyData(
      {required this.serviceId,
      required this.variationCode,
      required this.billersCode,
      required this.phoneNum});

  @override
  List<Object?> get props => [serviceId, variationCode, billersCode, phoneNum];
}

//states
abstract class DataState {}

class DataInitial extends DataState {}

class DataLoaded extends DataState {
  ServiceData dataPlans;

  DataLoaded({required this.dataPlans});
}

class DataLoading extends DataState {}

class DataError extends DataState {
  final String error;

  DataError({required this.error});

  @override
  List<Object> get props => [Error];
}

class DataSocketError extends DataState {}

class BuyDataLoading extends DataState {}

class BuyDataError extends DataState {
  final String error;
  BuyDataError({required this.error});

  @override
  List<Object> get props => [error];
}

class BuyDataSocketError extends DataState {}
