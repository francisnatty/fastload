import 'package:fastload/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //   controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SetUp PIN',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                child: PinCodeTextField(
                  appContext: context,
                  keyboardType: TextInputType.number,
                  controller: controller,
                  length: 4,
                  pinTheme: PinTheme(shape: PinCodeFieldShape.box),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
