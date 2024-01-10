part of 'tv_bloc.dart';

abstract class TvEvents extends Equatable {}

class GetTvSubs extends TvEvents {
  @override
  List<Object?> get props => [];
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
