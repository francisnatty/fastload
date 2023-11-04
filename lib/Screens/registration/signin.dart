import 'package:fastload/Screens/home/home_screen.dart';
import 'package:fastload/Screens/registration/components/pass_reset_bs.dart';
import 'package:fastload/bloc/auth/auth_bloc.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/utils/utils.dart';
import 'package:fastload/widgets/big_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeight = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: screenHeight * 0.15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWeight * 0.03),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      BigTextField(
                          controller: emailController, hintText: 'Email'),
                      const SizedBox(
                        height: 30,
                      ),
                      BigPassTextField(
                          controller: passController, hintText: 'Password'),
                      const SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return PassResetBottomSheet();
                                });
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.orange.shade900),
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context).add(LoginUser(
                                email: emailController.text,
                                password: passController.text));
                          },
                          style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  primaryColor),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              )),
                          child: BlocConsumer<AuthBloc, UserRegsitationState>(
                            listener: (context, state) {
                              if (state is UserRegsitationErrorState) {
                                Utils.showSnackBar(
                                    context, state.Error.toString());
                              } else if (state is NavigateToHomeScreen) {
                                Utils.pushAndRemoveScreen(
                                    context, HomeScreen());
                              } else if (state is NavigateToSignInScreen) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()),
                                    (route) => false);
                              } else if (state is UserRegistrationCodeSent) {
                                Utils.emailSentDialog(context);
                              }
                            },
                            builder: (context, state) {
                              if (state is UserRegsitationLoadingState) {
                                return const CircularProgressIndicator(
                                  color: white,
                                );
                              } else {
                                return Text(
                                  'LOGIN',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Dont have an account?'),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.orange.shade800),
                              child: const Text(
                                'SignUp',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
