part of 'auth_bloc.dart';

abstract class UserRegistrationEvent {}

class LoginUser extends UserRegistrationEvent {
  final String email;
  final String password;
  LoginUser({required this.email, required this.password});
}

class RegisterUser extends UserRegistrationEvent {
  final String email;
  final String password;

  RegisterUser({required this.email, required this.password});
}

abstract class UserRegsitationState {}

class UserRegsitationInitialState extends UserRegsitationState {}

class UserRegsitationLoadingState extends UserRegsitationState {}

class NavigateToSignInScreen extends UserRegsitationState {}

class NavigateToHomeScreen extends UserRegsitationState {}

class UserRegsitationErrorState extends UserRegsitationState {
  final String Error;

  UserRegsitationErrorState({required this.Error});
  @override
  List<Object> get props => [Error];
}

class UserRegistrationCodeSent extends UserRegsitationState {}
//class UserRegistrationSendCode extends UserRegsitationState{}
