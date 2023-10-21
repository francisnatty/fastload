import 'package:fastload/Screens/Electricity/model.dart/meter_companies.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/constants/image.dart';
import 'package:fastload/widgets/myTextField.dart';
import 'package:flutter/material.dart';

class PrepaidPage extends StatefulWidget {
  const PrepaidPage({super.key});

  @override
  State<PrepaidPage> createState() => _PrepaidPageState();
}

class _PrepaidPageState extends State<PrepaidPage> {
  TextEditingController meterNoController = TextEditingController();
  TextEditingController amtController = TextEditingController();
  MeterCompanies? initailModel;
  List<MeterCompanies> companies = [
    MeterCompanies(photo: Images.kaduna, title: 'Kaduna Electricity'),
    MeterCompanies(photo: Images.ikeja, title: 'Ikeja Electricity'),
    MeterCompanies(photo: Images.kano, title: 'Kano Electricity'),
    MeterCompanies(photo: Images.jos, title: 'Jos Electricity'),
    MeterCompanies(photo: Images.enugu, title: 'Enugu Electricity'),
    MeterCompanies(photo: Images.benin, title: 'Benin Electricity'),
    MeterCompanies(photo: Images.abuja, title: 'Abuja Electricity'),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Material(
          borderRadius: BorderRadius.circular(10),
          color: grey.withOpacity(0.3),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Select Provider',
                style: TextStyle(
                    fontWeight: FontWeight.w700, color: Colors.grey[500]),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    elevation: 0,
                    value: initailModel,
                    items: companies.map((e) {
                      return DropdownMenuItem<MeterCompanies>(
                          value: e,
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: Image.asset(e.photo).image,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(e.title),
                            ],
                          ));
                    }).toList(),
                    onChanged: (MeterCompanies? l) {}),
              ),
            )
          ]),
        ),
        SizedBox(
          height: 20,
        ),
        MyTextField(
            controller: meterNoController, hintText: 'Enter Meter Number'),
        SizedBox(
          height: 20,
        ),
        MyTextField(controller: amtController, hintText: 'Amount'),
        SizedBox(
          height: 80,
        ),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Pay',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                foregroundColor: MaterialStateProperty.all<Color>(white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
          ),
        )
      ],
    );
  }
}
