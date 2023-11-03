import 'dart:io';

import 'package:fastload/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  static createUser(BuildContext context, String email, String password) async {
    final user = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password))
        .user;
  }

  static login(BuildContext context, String email, String password) async {
    try {
      final user = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password))
          .user;

      if (user != null) {
        print('login sucessful');
      } else {}
    } on SocketException {
      Utils.showSnackBar(context, 'little of no internet connection');
    } catch (e) {
      Utils.showSnackBar(context, '$e');
    }
  }
}
