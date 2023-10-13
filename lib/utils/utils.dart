import 'package:flutter/material.dart';

class Utils {
  static showSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }
  //Navigate to another screen

  static Navigate(BuildContext context, Widget newScreen) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => newScreen));
  }
}
