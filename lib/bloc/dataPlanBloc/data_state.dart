// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'data_bloc.dart';

abstract class DataEvent extends Equatable {}

class FetchDataPlans extends DataEvent {
  @override
  List<Object?> get props => [];
}

class BuyData extends DataEvent {
  final Map<String, dynamic> data;
  final BuildContext context;

  BuyData({required this.data, required this.context});

  @override
  List<Object?> get props => [data, context];
}

//states
abstract class DataState extends Equatable {}

class DataInitial extends DataState {
  @override
  List<Object?> get props => [];
}

class DataLoaded extends DataState {
  List<ServiceData> dataPlans;

  DataLoaded({required this.dataPlans});
  @override
  List<Object?> get props => [dataPlans];
}

class DataLoading extends DataState {
  @override
  List<Object?> get props => [];
}

class DataError extends DataState {
  final String error;

  DataError({required this.error});

  @override
  List<Object> get props => [Error];
}

class BuyDataLoading extends DataState {
  @override
  List<Object?> get props => [];
}

class BuyDataSucess extends DataState {
  @override
  List<Object?> get props => [];
}

class BuyDataError extends DataState {
  final String error;
  BuyDataError({required this.error});
  @override
  List<Object?> get props => [error];
}

class BuyDataReset extends DataState {
  @override
  List<Object?> get props => [];
}
