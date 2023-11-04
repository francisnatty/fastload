import 'dart:io';

import 'package:fastload/bloc/auth/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          await user.sendEmailVerification().then((value) {
            emit(UserRegistrationCodeSent());
          });
        } else {
          emit(UserRegsitationErrorState(
              Error: 'Unable to create acct,PLS TRY AGAIN'));
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          emit(UserRegsitationErrorState(
              Error: e.message.toString() + ',LOGIN'));
          emit(NavigateToSignInScreen());
        }

        emit(UserRegsitationErrorState(Error: e.message.toString()));
      } on SocketException {
        emit(UserRegsitationErrorState(Error: 'Internet error'));
      } catch (e) {
        emit(UserRegsitationErrorState(Error: e.toString()));
      }
    });

    on<LoginUser>((event, emit) async {
      emit(UserRegsitationLoadingState());

      try {
        final user =
            await authRepository.loginUser(event.email, event.password);
        if (user != null) {
          if (user.emailVerified) {
            emit(NavigateToHomeScreen());
          } else {
            await user.sendEmailVerification().then((value) {
              emit(UserRegistrationCodeSent());
            });
          }
        } else {
          emit(
              UserRegsitationErrorState(Error: 'Unable to Login,PLS TRYAGAIN'));
        }
      } on FirebaseAuthException catch (e) {
        emit(UserRegsitationErrorState(Error: e.message.toString()));
      } on SocketException {
        emit(UserRegsitationErrorState(Error: 'Internet error'));
      } catch (e) {
        emit(UserRegsitationErrorState(Error: e.toString()));
      }
    });
  }
  void goToSignUpScreen() {
    // emit(NavigateToSignUpScreen());
  }
}
