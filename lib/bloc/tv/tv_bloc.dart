import 'package:equatable/equatable.dart';
import 'package:fastload/Model/tv_model.dart';

import 'package:fastload/repository/tv_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tv_state.dart';

class TvBloc extends Bloc<TvEvents, TvState> {
  TvRepository tvRepository;
  TvBloc({required this.tvRepository}) : super(TvInitial()) {
    on<GetTvSubs>((event, emit) => _getTvSubs(event, emit));
    add(GetTvSubs());
  }

  void _getTvSubs(GetTvSubs event, Emitter<TvState> emit) async {
    emit(TvLoading());

    final response = await tvRepository.getAllTvSubs();
    response.fold(
        (l) => emit(TvError(error: l)), (r) => emit(TvSucess(subs: r)));
  }
}
