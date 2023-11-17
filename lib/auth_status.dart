import 'package:fastload/Screens/home/home_screen.dart';
import 'package:fastload/Screens/registration/signup.dart';
import 'package:fastload/cubit/authchecck/authcheck_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthStatus extends StatelessWidget {
  const AuthStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCheckCubit, AuthCheckState>(
        builder: (context, state) {
      if (state.user == null) {
        return const SignUp();
      } else {
        return const HomeScreen();
      }
    });
  }
}
