import 'dart:ffi';

import 'package:fastload/Screens/buyData/model/data_model.dart';
import 'package:fastload/bloc/dataPlanBloc/mtn_repository.dart';
import 'package:fastload/bloc/dataPlanBloc/data_bloc.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/utils/utils.dart';
import 'package:fastload/widgets/numTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants/image.dart';
import '../components/internet_error_dialog.dart';

class Data extends StatefulWidget {
  final ServiceData? mtnData;
  Data({super.key, required this.mtnData});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  TextEditingController phoneController = TextEditingController();
  String variationCode = '';
  int? billersCode = 08011111111;
  int? phoneNum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      const SizedBox(
        height: 15,
      ),
      Wrap(
        spacing: 10,
        runSpacing: 10,
        children: widget.mtnData!.variations.map((e) {
          return dataPakage(e);
        }).toList(),
      ),
      const SizedBox(
        height: 20,
      ),
      NumTextField(
        controller: phoneController,
        hintText: 'Enter number',
        fillColor: Colors.white,
      ),
      const SizedBox(
        height: 20,
      ),
      SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.07,
        child: ElevatedButton(
          onPressed: () {
            if (phoneController.text.length != 11 &&
                variationCode.isEmpty &&
                billersCode != null) {
              context.read<DataBloc>().add(BuyData(
                  serviceId: widget.mtnData!.serviceID,
                  variationCode: variationCode,
                  billersCode: 08011111111,
                  phoneNum: int.parse(phoneController.text)));
            } else {
              Utils.showSnackBar(context, 'Input not complete');
            }
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(white),
            backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
          ),
          child: const Text('Buy Data'),
        ),
      )
    ]));
  }

  Container dataPakage(ServiceVariation variation) {
    double amt = double.parse(variation.amount);

    return Container(
      padding: const EdgeInsets.only(bottom: 2, top: 2),
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(20)),
        child: GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: Column(children: [
            Expanded(
                child: Text(
              variation.dataPrice,
              style: TextStyle(color: black, fontWeight: FontWeight.bold),
            )),
            Text(
              variation.dataAmount,
              style: const TextStyle(
                  color: primaryColor, fontWeight: FontWeight.w600),
            ),
            Text(
              variation.duration,
              style: const TextStyle(color: primaryColor, fontSize: 12),
            )
          ]),
        ),
      ),
    );
  }
}
