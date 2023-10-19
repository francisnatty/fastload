import 'package:fastload/constants/colors.dart';
import 'package:fastload/firebase/firebase_service.dart';
import 'package:fastload/utils/utils.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeight = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: lightBlack,
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
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return Utils.showSnackBar(
                                      context, 'Email is Empty');
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Email',
                                border: InputBorder.none,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none),
                                contentPadding: const EdgeInsets.only(left: 20),
                                fillColor: grey.withOpacity(0.3),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: passController,
                              keyboardType: TextInputType.number,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return Utils.showSnackBar(
                                      context, 'Password is Empty');
                                } else if (value.length < 6) {
                                  return Utils.showSnackBar(context,
                                      'Password must be more than four');
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Password',
                                border: InputBorder.none,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none),
                                contentPadding: const EdgeInsets.only(left: 20),
                                fillColor: grey.withOpacity(0.3),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.orange.shade900),
                                child: const Text(
                                  'Forgot password',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: screenWeight * 0.5,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    FirebaseService.createUser(
                                        context,
                                        emailController.text,
                                        passController.text);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.orange.shade700),
                                child: const Text('Login'),
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
                                        foregroundColor:
                                            Colors.orange.shade800),
                                    child: const Text(
                                      'SignUp',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
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
