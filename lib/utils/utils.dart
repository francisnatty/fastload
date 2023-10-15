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

  displayDialog(BuildContext context, String subtitle, alertType type) {
    return showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Column(
              children: [
                Text(
                  _tranString(type),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: _checkColor(type)),
                  child: Icon(
                    Icons.gpp_good,
                    color: _selectColor(type),
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(subtitle)
              ],
            ),
          );
        });
  }

  Color _selectColor(alertType type) {
    switch (type) {
      case alertType.sucess:
        return Colors.green;
      case alertType.fail:
        return Colors.red;
      case alertType.processing:
      default:
        return Colors.blue;
    }
  }

  Color _checkColor(alertType type) {
    switch (type) {
      case alertType.sucess:
        return Colors.green.withOpacity(0.2);
      case alertType.fail:
        return Colors.red.withOpacity(0.2);
      case alertType.processing:
      default:
        return Colors.blue.withOpacity(0.2);
    }
  }

  String _tranString(alertType type) {
    switch (type) {
      case alertType.sucess:
        return 'Transaction Sucessful';
      case alertType.fail:
        return 'Transaction Failed';
      case alertType.processing:
        return 'Transaction Processing';
      default:
        return 'Processing';
    }
  }
}
