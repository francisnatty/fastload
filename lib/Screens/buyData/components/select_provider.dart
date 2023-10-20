import 'package:fastload/Screens/buyData/model/service_provider_model.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/constants/image.dart';
import 'package:fastload/widgets/myTextField.dart';
import 'package:flutter/material.dart';

class SelectProvider extends StatefulWidget {
  const SelectProvider({super.key});

  @override
  State<SelectProvider> createState() => _SelectProviderState();
}

class _SelectProviderState extends State<SelectProvider> {
  ServiceProviderModel? initial;
  String selectprovider = 'Select Provider';
  List<ServiceProviderModel> serviceP = [
    ServiceProviderModel(
        ServiceId: 'mtn-data', asset: Images.mtn, serviceName: 'mtn Data'),
    ServiceProviderModel(
        ServiceId: 'glo-data', asset: Images.glo, serviceName: 'glo Data'),
    ServiceProviderModel(
        ServiceId: 'airtel-data',
        asset: Images.airtel,
        serviceName: 'airtel Data'),
    ServiceProviderModel(
        ServiceId: '9mobile-data',
        asset: Images.mobile,
        serviceName: '9mobile Data'),
  ];
  String? initialImage = Images.mtn;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: grey.withOpacity(0.3),
      borderRadius: BorderRadius.circular(15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: Image.asset(initialImage!).image,
            ),
          ),

          Text(
            selectprovider,
            style: TextStyle(fontWeight: FontWeight.bold, color: grey),
          ),
          Spacer(),
          PopupMenuButton<ServiceProviderModel>(
              initialValue: ServiceProviderModel(
                  ServiceId: 'mtn-data',
                  asset: Images.mtn,
                  serviceName: 'mtn Data'),
              // color: grey.withOpacity(0.3),
              itemBuilder: (context) {
                return serviceP.map((e) {
                  return PopupMenuItem<ServiceProviderModel>(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectprovider = e.serviceName;
                        initialImage = e.asset;
                      });
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: Image.asset(e.asset).image,
                        ),
                        SizedBox(width: 20),
                        Text(e.serviceName),
                      ],
                    ),
                  ));
                }).toList();
              })
          // DropdownButton(
          //     focusColor: black,
          //     value: initial,
          //     items: serviceP.map<DropdownMenuItem<ServiceProviderModel>>((e) {
          //       return DropdownMenuItem<ServiceProviderModel>(
          //           value: e,
          //           child: Row(
          //             children: [
          //               CircleAvatar(
          //                 backgroundImage: Image.asset(e.asset).image,
          //               ),
          //               Text(e.asset),
          //             ],
          //           ));
          //     }).toList(),
          //     onChanged: (value) {
          //       setState(() {});
          //     })
        ],
      ),
    );
  }
}
