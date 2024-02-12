import 'dart:developer';

import 'package:fastload/Screens/Electricity/bloc/electricity_bloc.dart';
import 'package:fastload/Screens/Electricity/bloc/electricity_state.dart';
import 'package:fastload/Screens/Electricity/model.dart/meter_companies.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/constants/image.dart';
import 'package:fastload/constants/textstyles.dart';
import 'package:fastload/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrepaidPage extends StatefulWidget {
  final String serviceType;

  const PrepaidPage({super.key, required this.serviceType});

  @override
  State<PrepaidPage> createState() => _PrepaidPageState();
}

class _PrepaidPageState extends State<PrepaidPage> {
  TextEditingController meterNoController = TextEditingController();
  TextEditingController amtController = TextEditingController();
  MeterCompanies? selectedService;
  final _formKey = GlobalKey<FormState>();

  List<MeterCompanies> companies = [
    MeterCompanies(
        photo: Images.kaduna,
        title: 'Kaduna Electricity',
        serviceId: 'ikeja-electric'),
    MeterCompanies(
      photo: Images.ikeja,
      title: 'Ikeja Electricity',
      serviceId: 'ikeja-electric',
    ),
    MeterCompanies(
      photo: Images.kano,
      title: 'Kano Electricity',
      serviceId: 'ikeja-electric',
    ),
    MeterCompanies(
      photo: Images.jos,
      title: 'Jos Electricity',
      serviceId: 'ikeja-electric',
    ),
    MeterCompanies(
      photo: Images.enugu,
      title: 'Enugu Electricity',
      serviceId: 'ikeja-electric',
    ),
    MeterCompanies(
      photo: Images.benin,
      title: 'Benin Electricity',
      serviceId: 'ikeja-electric',
    ),
    MeterCompanies(
      photo: Images.abuja,
      title: 'Abuja Electricity',
      serviceId: 'ikeja-electric',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(Images.electricity),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: meterNoController,
            validator: (value) {
              if (value == null && value!.length != 13) {
                return 'incorrect meter num';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Enter Meter Number',
              border: InputBorder.none,
              fillColor: lightGrey,
              filled: true,
              contentPadding: EdgeInsets.all(13.h),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide.none),
              hintStyle: bigText.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          DropdownButtonFormField(
            items: companies.map((MeterCompanies e) {
              return DropdownMenuItem(
                  value: e,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: Image.asset(e.photo).image,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        e.title,
                        style: bigText,
                      ),
                    ],
                  ));
            }).toList(),
            onChanged: (newValue) {
              selectedService = newValue;
            },
            decoration: InputDecoration(
                hintText: 'Select Provider',
                hintStyle: bigText.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
                contentPadding: EdgeInsets.all(10.w),
                filled: true,
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: BorderSide.none),
                fillColor: lightGrey),
          ),
          SizedBox(
            height: 100.h,
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (selectedService == null) {
                  showSnackBar(context, 'Select a Service');
                } else {
                  context.read<ElectricityBloc>().add(VerifyMeterNumber(
                      meterNum: 1111111111111,
                      serviceId: selectedService!.serviceId,
                      type: widget.serviceType));
                }
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(primaryColor),
                  foregroundColor: MaterialStateProperty.all<Color>(white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)))),
              child: const Text(
                'Verify',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
          )
        ],
      ),
    );
  }
}
