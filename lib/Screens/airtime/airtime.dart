import 'package:fastload/Screens/airtime/network_popup.dart';
import 'package:fastload/Screens/airtime/prices.dart';
import 'package:fastload/constants/colors.dart';
import 'package:flutter/material.dart';

class AirtimePage extends StatefulWidget {
  const AirtimePage({super.key});

  @override
  State<AirtimePage> createState() => _AirtimePageState();
}

class _AirtimePageState extends State<AirtimePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController amtController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //AirtimeAPI.purchaseMtnAirtime();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
          title: const Text(
            'Buy Airtime',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
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
                  Expanded(
                      child: TextField(
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        hintText: 'Select Provider',
                        border: InputBorder.none),
                  )),
                  const NetworkPopUp(),
                ]),
              ),
              SizedBox(
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
                        if (text == null || text.isEmpty) {
                          return 'No Number';
                        } else if (text != 11) {
                          return 'Incorrect number';
                        }
                        return null;
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
                              borderRadius: BorderRadius.circular(10),
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
              const Divider(
                color: primaryColor,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'amount cannot be less than 50naira',
                style: TextStyle(
                    color: grey, fontWeight: FontWeight.w800, fontSize: 12),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: width,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                    } else {}
                  },
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)))),
                  child: const Text(
                    'BUY',
                    style: TextStyle(fontWeight: FontWeight.bold),
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
