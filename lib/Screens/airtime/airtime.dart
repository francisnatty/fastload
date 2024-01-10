import 'package:fastload/Screens/airtime/airtime_API.dart';
import 'package:fastload/Screens/airtime/network_popup.dart';
import 'package:fastload/Screens/airtime/prices.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/cubit/airtime/airtime_cubit.dart';
import 'package:fastload/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AirtimePage extends StatefulWidget {
  const AirtimePage({super.key});

  @override
  State<AirtimePage> createState() => _AirtimePageState();
}

class _AirtimePageState extends State<AirtimePage> {
  final _formKey = GlobalKey<FormState>();
  final bool _isHovered = false;
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController amtController = TextEditingController();
  String serviceId = 'mtn';
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    phoneNumController;
    amtController;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            'Buy Airtime',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
          )),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              // const Text(
              //   'Choose Network and Enter Number',
              //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              // ),
              const SizedBox(
                height: 15,
              ),
              Material(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(0.2),
                child: Row(children: [
                  const Expanded(
                      child: TextField(
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Select Provider',
                        border: InputBorder.none),
                  )),
                  NetworkPopUp(onChanged: (value) {
                    serviceId = value;
                  })
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  //  const NetworkPopUp(),
                  const SizedBox(
                    width: 3,
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (text) {
                        return null;
                      
                        // if (text == null || text.isEmpty) {
                        //   return 'No Number';
                        // } else if (text != 11) {
                        //   return 'Incorrect number';
                        // }
                        // return null;
                      },
                      controller: phoneNumController,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: grey.withOpacity(0.2),
                          border: InputBorder.none,
                          hintText: 'Enter Number',
                          hintStyle: const TextStyle(fontSize: 13),
                          contentPadding: const EdgeInsets.all(15),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none)),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: const TextStyle(fontWeight: FontWeight.bold),
                controller: amtController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {}
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  filled: true,
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(0.2),
                  hintText: 'Amount',
                  hintStyle: const TextStyle(fontSize: 13),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const PriceList(),
              // const Divider(
              //   color: primaryColor,
              // ),
              const SizedBox(
                height: 5,
              ),

              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: width,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {});

                    String phone = phoneNumController.text;
                    String amt = amtController.text;
                    int? phoneNum = int.tryParse(phone);
                    int? amtt = int.tryParse(amt);
                    String dateformat = formateDateTime();
                    Map<String, dynamic> data = {
                      'request_id': '202401081014YUs83meikd',
                      'serviceID': 'mtn',
                      'amount': 200,
                      'phone': 08011111111,
                    };

                    context.read<AirtimeCubit>().buyData(data);
                  },
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(white),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.black;
                        }
                        return primaryColor;
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  child: BlocConsumer<AirtimeCubit, AirtimeState>(
                    listener: (context, state) {
                      if (state is BuyAirtimeError) {
                        showSnackBar(context, state.error);
                      }
                    },
                    builder: (context, state) {
                      if (state is BuyAirtimeLoading) {
                        return Center(
                          child: showLoadingIndicator(),
                        );
                      } else {
                        return const Text(
                          'BUY',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        );
                      }
                    },
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
