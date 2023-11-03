part of 'auth_bloc.dart';

abstract class UserRegistrationEvent {}

class RegisterUser extends UserRegistrationEvent {
  final String email;
  final String password;

  RegisterUser({required this.email, required this.password});
}

abstract class UserRegsitationState {}

class UserRegsitationInitialState extends UserRegsitationState {}

class UserRegsitationLoadingState extends UserRegsitationState {}

class UserRegsitationErrorState extends UserRegsitationState {
  final String Error;

  UserRegsitationErrorState({required this.Error});
  @override
  List<Object> get props => [Error];
}
