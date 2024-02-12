import 'package:fastload/bloc/dataPlanBloc/data_repo.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/utils/api/api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
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
    controller;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: lightBlack,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: screenHeight * 0.10,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: grey.withOpacity(0.1), shape: BoxShape.circle),
                  child: const Icon(
                    Iconsax.verify4,
                    size: 100,
                    color: white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Enter your pin',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: PinCodeTextField(
                    appContext: context,
                    keyboardType: TextInputType.number,
                    controller: controller,
                    textStyle: const TextStyle(
                        color: white, fontWeight: FontWeight.bold),
                    length: 4,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        activeColor: primaryColor,
                        activeFillColor: primaryColor,
                        selectedFillColor: primaryColor,
                        inactiveColor: primaryColor,
                        selectedColor: primaryColor),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 390.w,
                  height: 65.h,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(primaryColor)),
                      onPressed: () {
                        print(controller.text);
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
