import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum alertType { sucess, fail, processing }

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
