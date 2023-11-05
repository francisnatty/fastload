import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class internetErrorDailog extends StatelessWidget {
  const internetErrorDailog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text(
        'Poor internet Connection',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
            fontSize: 17),
      ),
      content: Text(
        'Pls check your connection and try again',
        style: Theme.of(context).textTheme.bodySmall,
      ),
      actions: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(foregroundColor: Colors.green),
          child: const Text(
            'Ok',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          child: const Text(
            'Retry',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
