import 'package:fastload/bloc/auth/auth_bloc.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/constants/image.dart';
import 'package:fastload/constants/textstyles.dart';
import 'package:fastload/utils/utils.dart';
import 'package:fastload/widgets/myTextField.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PassResetBottomSheet extends StatefulWidget {
  PassResetBottomSheet({super.key});

  @override
  State<PassResetBottomSheet> createState() => _PassResetBottomSheetState();
}

class _PassResetBottomSheetState extends State<PassResetBottomSheet> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final authBloc=AuthBloc(authRepository: )
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
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(
                        RequestPasswordResetLink(email: emailController.text));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor),
                      foregroundColor: MaterialStateProperty.all<Color>(white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: BlocConsumer<AuthBloc, UserRegsitationState>(
                    listener: (context, state) {
                      if (state is ResetLinkSent) {
                        Utils.resetLinkSent(context);
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return Center(
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset(Images.loadingGif),
                          ),
                        );
                      } else {
                        return Text('Request');
                      }
                    },
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
