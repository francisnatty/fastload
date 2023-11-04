import 'package:fastload/constants/colors.dart';
import 'package:fastload/constants/textstyles.dart';
import 'package:fastload/widgets/myTextField.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PassResetBottomSheet extends StatelessWidget {
  PassResetBottomSheet({super.key});
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'Request Password Reset Link',
              style: boldText,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(controller: emailController, hintText: 'Enter Email'),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor),
                      foregroundColor: MaterialStateProperty.all<Color>(white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: Text(
                    'Request',
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
