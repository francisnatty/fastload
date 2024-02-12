import 'package:fastload/Screens/buyData/model/data_model.dart';
import 'package:fastload/bloc/dataPlanBloc/data_bloc.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/global/global_variables.dart';
import 'package:fastload/utils/utils.dart';
import 'package:fastload/widgets/numTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Data extends StatefulWidget {
  final ServiceData? mtnData;
  const Data({super.key, required this.mtnData});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  TextEditingController phoneController = TextEditingController();
  String variationCode = '';
  String billersCode = '08011111111';
  int? phoneNum;
  int selectedIndex = -1;

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
        // children: widget.mtnData!.variations.map((e) {

        //   return dataPakage(e);
        // }).toList(),
        children: List.generate(widget.mtnData!.variations.length, (index) {
          return dataPakage(widget.mtnData!.variations[index], index);
        }),
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
            String dateFormat = formateDateTime();
            Map<String, dynamic> dataDetails = {
              'request_id': '${dateFormat}natty',
              'serviceID': widget.mtnData!.serviceID,
              'billersCode': billersCode,
              'variation_code': variationCode,
              'phone': 09022901746,
            };
            context
                .read<DataBloc>()
                .add(BuyData(data: dataDetails, context: context));
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(white),
            backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
          ),
          child: const Text(
            'Buy Data',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      )
    ]));
  }

  Container dataPakage(ServiceVariation variation, int index) {
    double amt = double.parse(variation.amount);

    return Container(
      padding: const EdgeInsets.only(bottom: 2, top: 2),
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 85.h,
        width: 85.w,
        decoration: BoxDecoration(
            color: selectedIndex == index ? Colors.black87 : white,
            borderRadius: BorderRadius.circular(20)),
        child: GestureDetector(
          onTap: () {
            setState(() {
              variationCode = variation.code;
              selectedIndex = index;
            });
          },
          child: Column(children: [
            Expanded(
                child: Text(
              variation.dataPrice,
              style: TextStyle(
                  color: selectedIndex == index ? white : black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp),
            )),
            Text(
              variation.dataAmount,
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp),
            ),
            Text(
              variation.duration,
              style: TextStyle(color: primaryColor, fontSize: 13.sp),
            )
          ]),
        ),
      ),
    );
  }
}
