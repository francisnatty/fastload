import 'package:fastload/bloc/auth/auth_bloc.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/utils/utils.dart';
import 'package:fastload/widgets/big_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                            'Create Account',
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
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context).add(RegisterUser(
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
                              } else if (state is UserRegistrationCodeSent) {
                                Utils.emailSentDialog(context);
                              }
                            },
                            builder: (context, state) {
                              if (state is LoadingState) {
                                return const CircularProgressIndicator(
                                  color: white,
                                );
                              } else {
                                return const Text(
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
                            const Text('Already have an acct?'),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.orange.shade800),
                              child: const Text(
                                'Login',
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
