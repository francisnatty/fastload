import 'package:fastload/helperFunc/sharedpref.dart';
import 'package:flutter/material.dart';

class Global {
  static late SharedPref sharedPref;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    sharedPref = await SharedPref().init();
  }
}
