import 'package:fastload/Screens/registration/signin.dart';
import 'package:fastload/Screens/registration/signup.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/constants/image.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: const Text(
                //     'FastLoad',
                //     style: TextStyle(
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //         // fontFamily: 'Victor',
                //         color: primaryColor),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: SizedBox(
                    // height: MediaQuery.sizeOf(context).height * 0.2,
                    child: Image.asset(
                      Images.paybills,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Pay \nbills with \nease',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        fontFamily: 'Victor',
                        color: white),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const SignIn()));
                    },
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(
                            const BorderSide(color: primaryColor, width: 2.0)),
                        foregroundColor:
                            MaterialStateProperty.all(primaryColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const SignUp()));
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(white),
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      child: const Text(
                        'SIGNUP',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ))
              ]),
        ),
      ),
    );
  }
}
