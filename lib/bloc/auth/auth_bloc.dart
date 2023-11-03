import 'dart:io';

import 'package:fastload/bloc/auth/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<UserRegistrationEvent, UserRegsitationState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository})
      : super(UserRegsitationInitialState()) {
    on<RegisterUser>((event, emit) async {
      emit(UserRegsitationLoadingState());

      try {
        final user =
            await authRepository.createUser(event.email, event.password);

        if (user != null) {
        } else {}
      } on FirebaseAuthException catch (e) {
        emit(UserRegsitationErrorState(Error: e.code.toString()));
      } on SocketException catch (e) {
        emit(UserRegsitationErrorState(Error: 'Internet error'));
      } catch (e) {
        emit(UserRegsitationErrorState(Error: e.toString()));
      }
    });
  }
  void backToInitialState() {
    emit(UserRegsitationInitialState());
  }
}
