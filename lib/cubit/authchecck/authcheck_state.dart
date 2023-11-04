part of 'authcheck_cubit.dart';

class AuthCheckState extends Equatable {
  final User? user;
  AuthCheckState({this.user});

  @override
  List<Object?> get props => [user];
}
