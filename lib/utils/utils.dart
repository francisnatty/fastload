import 'package:fastload/Screens/registration/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

enum alertType { sucess, fail, processing }

class Utils {
  static pushAndRemoveScreen(BuildContext context, Widget newScreen) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => newScreen), (route) => false);
  }

  static pushScreen(BuildContext context, Widget newScreen) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => newScreen));
  }

  static showSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }
  //Navigate to another screen

  static Navigate(BuildContext context, Widget newScreen) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => newScreen));
  }

  static resetLinkSent(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return const CupertinoAlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Check Email',
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Iconsax.message,
                  color: Colors.green,
                ),
              ],
            ),
            content: Column(
              children: [
                Text(
                  'Pls check your email for password reset link',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
              ],
            ),
          );
        });
  }

  static emailSentDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Verify Email',
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                ),
                Icon(
                  Iconsax.verify,
                  color: Colors.green,
                )
              ],
            ),
            content: const Column(
              children: [
                Text(
                  'Pls check your email for verification link',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
              ],
            ),
            actions: [
              TextButton(
                child: const Text(
                  'OK',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                      (route) => false);
                },
              )
            ],
          );
        });
  }
}
