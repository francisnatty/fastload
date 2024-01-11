part of 'tv_bloc.dart';

abstract class TvEvents extends Equatable {}

class GetTvSubs extends TvEvents {
  @override
  List<Object?> get props => [];
}

class VerifySmartCard extends TvEvents {
  final Map<String, dynamic> cardNum;

  VerifySmartCard({required this.cardNum});
  @override
  List<Object?> get props => [cardNum];
}

abstract class TvState extends Equatable {}

class TvInitial extends TvState {
  @override
  List<Object?> get props => [];
}

class TvLoading extends TvState {
  @override
  List<Object?> get props => [];
}

class TvError extends TvState {
  final String error;
  TvError({required this.error});
  @override
  List<Object?> get props => [error];
}

class TvSucess extends TvState {
  final List<TvModel> subs;
  TvSucess({required this.subs});
  @override
  List<Object?> get props => [subs];
}

class VerifyCardLoading extends TvState {
  @override
  List<Object?> get props => [];
}

class VerifyCardError extends TvState {
  final String error;
  VerifyCardError({required this.error});
  @override
  List<Object?> get props => [error];
}

class VerifyCardSuccess extends TvState {
  final VerifyCardModel status;
  VerifyCardSuccess({required this.status});
  @override
  List<Object?> get props => [status];
}
