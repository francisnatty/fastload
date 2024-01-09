part of 'airtime_cubit.dart';

abstract class AirtimeState extends Equatable {}

class BuyAirtimeInitial extends AirtimeState {
  @override
  List<Object?> get props => [];
}

class BuyAirtimeLoading extends AirtimeState {
  @override
  List<Object?> get props => [];
}

class BuyAirtimeError extends AirtimeState {
  final String error;
  BuyAirtimeError({required this.error});
  @override
  List<Object?> get props => [error];
}

class BuyAirtimeSucess extends AirtimeState {
  @override
  List<Object?> get props => [];
}
