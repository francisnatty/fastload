import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'authcheck_state.dart';

class AuthCheckCubit extends Cubit<AuthCheckState> {
  AuthCheckCubit() : super(const AuthCheckState());

  void checkAuthStatus() {
    final User? user = FirebaseAuth.instance.currentUser;
    emit(AuthCheckState(user: user));
  }
}
