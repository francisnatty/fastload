import 'dart:io';

import 'package:fastload/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  static createUser(BuildContext context, String email, String password) async {
    try {
      final user = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password))
          .user;

      // if (user != null) {
      //   print(user.email);
      // } else {
      //   print('failed');
      // }
    } on FirebaseAuthException catch (e) {
      print('${e}');
      Utils.showSnackBar(context, '${e}');
    } on SocketException catch (e) {
      Utils.showSnackBar(context, 'Little or no internet connection');
    } catch (e) {
      print('$e');
      Utils.showSnackBar(context, '${e}');
    }
  }

  static login(BuildContext context, String email, String password) async {
    try {
      final user = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password))
          .user;

      if (user != null) {
        print('login sucessful');
      } else {}
    } on SocketException catch (e) {
      Utils.showSnackBar(context, 'little of no internet connection');
    } catch (e) {
      Utils.showSnackBar(context, '$e');
    }
  }
}
