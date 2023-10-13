import 'package:flutter/material.dart';

class FastSignIn extends StatefulWidget {
  const FastSignIn({Key? key}) : super(key: key);

  @override
  State<FastSignIn> createState() => _FastSignInState();
}

class _FastSignInState extends State<FastSignIn> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeight = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.orange,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
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
                      Positioned(
                        top: 0,
                        right: 0,
                        bottom: 0,
                        left: 0,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // MyTextField(
                              //   title: 'Email',
                              //   obsecure: false,
                              //   icon: Iconsax.message4,
                              // ),
                              // const SizedBox(
                              //   height: 20,
                              // ),
                              // MyTextField(
                              //   title: 'password',
                              //   obsecure: true,
                              //   icon: Iconsax.lock,
                              // ),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: screenWeight * 0.5,
                                child: ElevatedButton(
                                  onPressed: () {},
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
