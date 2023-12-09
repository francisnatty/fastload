// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'data_bloc.dart';

abstract class DataEvent extends Equatable {}

class FetchDataPlans extends DataEvent {
  // FetchDataPlans({required this.allNetwork})
  @override
  List<Object?> get props => [];
}

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

enum DataStateEnum {
  initial,
  fetchingData,

  buyingData,
  error,
  success,
  socketError
}

//states
class DataState extends Equatable {
  final List<ServiceData>? allNetworks;
  final DataStateEnum status;
  final String? error;

  const DataState(
      {this.error, this.status = DataStateEnum.initial, this.allNetworks});

  @override
  List<Object?> get props => [
        status,
        error,
      ];

  DataState copyWith(
      {ServiceData? dataPlans,
      DataStateEnum? status,
      String? error,
      List<ServiceData>? allNetworks}) {
    return DataState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}

// class DataInitial extends DataState {}

// class DataLoaded extends DataState {
//   ServiceData dataPlans;

//   DataLoaded({required this.dataPlans});
// }

// class DataLoading extends DataState {}

// class DataError extends DataState {
//   final String error;

//   DataError({required this.error});

//   @override
//   List<Object> get props => [Error];
// }

// class DataSocketError extends DataState {}

// class BuyDataLoading extends DataState {}

// class BuyDataError extends DataState {
//   final String error;
//   BuyDataError({required this.error});

//   @override
//   List<Object> get props => [error];
// }

// class BuyDataSocketError extends DataState {}
