import 'package:flutter/material.dart';

class Utils {
  static showSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }
}
