//Events
import 'package:fastload/Screens/buyData/model/data_model.dart';

abstract class DataEvent {}

class FetchDataPlans extends DataEvent {}

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
}

class DataSocketError extends DataState {}
