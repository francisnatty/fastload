import 'package:fastload/Screens/buyData/components/select_provider.dart';
import 'package:fastload/Screens/buyData/model/service_provider_model.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/constants/image.dart';
import 'package:fastload/widgets/myTextField.dart';
import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text(
            'Buy Data',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SelectProvider(),
          SizedBox(
            height: 15,
          ),
          MyTextField(
              controller: phoneController, hintText: 'Select Data Plan'),
          SizedBox(
            height: 20,
          ),
          MyTextField(controller: phoneController, hintText: 'Enter number'),
        ]),
      ),
    );
  }
}
