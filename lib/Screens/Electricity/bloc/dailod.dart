import 'package:fastload/Screens/Electricity/bloc/sucessbloc.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/utils/pay_process_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuccessDialogBloc, SuccessDialogState>(
        builder: (context, state) {
      if (state == SuccessDialogState.success) {
        return CustomDailog(
            title: 'Transaction SucessFull',
            subtitle: 'Thank you',
            color: Colors.green,
            opColor: Colors.green.withOpacity(0.3));
      } else if (state == SuccessDialogState.error) {
        return CustomDailog(
            title: 'Transaction Failed',
            subtitle: 'Thank you',
            color: Colors.red,
            opColor: Colors.red.withOpacity(0.3));
      } else {
        return SizedBox.shrink();
      }
    });
  }
}

class CustomDailog extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final Color opColor;
  const CustomDailog(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.color,
      required this.opColor});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      actions: [
        TextButton(
            onPressed: () {
              context.read<SuccessDialogBloc>().resetDialogState();
            },
            child: Text('Ok'))
      ],
      content: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(shape: BoxShape.circle, color: opColor),
            child: Icon(
              Icons.gpp_good,
              color: color,
              size: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            subtitle,
            style: TextStyle(fontFamily: 'Montserrat'),
          ),
        ],
      ),
    );
    ;
  }
}
