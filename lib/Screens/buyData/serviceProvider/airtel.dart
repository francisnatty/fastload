import 'package:fastload/Screens/buyData/Api.dart/buy_data_api.dart';
import 'package:fastload/Screens/buyData/model/data_model.dart';
import 'package:fastload/bloc/dataPlanBloc/data_bloc.dart';
import 'package:fastload/bloc/dataPlanBloc/mtn_repository.dart';
import 'package:fastload/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AirtelData extends StatefulWidget {
  final ServiceData? airtelData;

  const AirtelData({super.key, required this.airtelData});

  @override
  State<AirtelData> createState() => _AirtelDataState();
}

class _AirtelDataState extends State<AirtelData> {
  TextEditingController phoneController = TextEditingController();
  String textValue = '';
  String? dropdownValue;
  ServiceVariation? selectedItem;
  Color onclickedColor = const Color.fromRGBO(0, 0, 0, 1);
  bool onClicked = false;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBloc(dataRepository: DataRepository()),
      child: Container(
          color: Colors.transparent,
          child: BlocConsumer<DataBloc, DataState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.status == DataStateEnum.success) {
                //  ServiceData? dataList = [];
                ServiceData? dataList = state.allNetworks![1];
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: dataList!.variations.map((e) {
                          String name = e.name;

                          return dataPakage(e.code, e.name);
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // MyTextField(
                      //     controller: phoneController, hintText: 'Enter number',),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: ElevatedButton(
                            onPressed: () {
                              // print(serviceData.serviceID);

                              // DataAPI().buyMtnData(context, serviceData.serviceID,
                              //     'mtn-10mb-100', '08011111111', 08011111111);
                              // setState(() {
                              //   isLoading = false;
                              // });
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  primaryColor),
                            ),
                            child: const Text(
                              'Buy data',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ))
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          )),
    );
  }

  Container dataPakage(String price, String dataSize) {
    List<String> parts = dataSize.split('-');
    String data = parts[1];
    List<String> dataSplitted = data.split(' ');

    return Container(
      padding: const EdgeInsets.all(8),
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          color: grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
        onTap: () {
          setState(() {
            onClicked = true;
          });
        },
        child: Column(children: [
          Expanded(
              child: Text(
            dataSplitted[1],
            style: TextStyle(color: black, fontWeight: FontWeight.bold),
          )),
          Text(
            parts[2],
            style: const TextStyle(
                color: primaryColor, fontWeight: FontWeight.w600),
          ),
          Text(
            parts.contains(3) ? parts[3] : '7 days',
            style: const TextStyle(color: primaryColor, fontSize: 12),
          )
        ]),
      ),
    );
  }
}
