import 'package:fastload/Screens/airtime/airtime_API.dart';
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
  TextEditingController phoneNumController = TextEditingController();
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            'Buy Airtime',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(
              children: [
                NetworkPopUp(),
                SizedBox(
                  width: 3,
                ),
                Expanded(
                    child: TextField(
                  controller: phoneNumController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            PriceList()
          ]),
        ),
      ),
    );
  }
}
