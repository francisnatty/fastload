import 'package:fastload/Screens/Electricity/bloc/sucessbloc.dart';
import 'package:fastload/Screens/buyData/Api.dart/buy_data_api.dart';
import 'package:fastload/Screens/buyData/model/data_model.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/widgets/myTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MtnData extends StatefulWidget {
  const MtnData({super.key});

  @override
  State<MtnData> createState() => _MtnDataState();
}

class _MtnDataState extends State<MtnData> {
  TextEditingController phoneController = TextEditingController();
  String textValue = '';
  String? dropdownValue;
  ServiceVariation? selectedItem;
  Color onclickedColor = const Color.fromRGBO(0, 0, 0, 1);
  bool onCliced = false;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    DataAPI().getMtnDataPlans(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<ServiceData?>(
            future: DataAPI().getMtnDataPlans(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }

              final serviceData = snapshot.data;
              List<ServiceVariation> dataList = serviceData!.variations;

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: dataList.map((e) {
                        String name = e.name;

                        return dataPakage(e.code, e.name);
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                        controller: phoneController, hintText: 'Enter number'),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<SuccessDialogBloc>()
                                .makeApiCallAndShowDialog();
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
                            backgroundColor:
                                MaterialStateProperty.all<Color>(primaryColor),
                          ),
                          child: const Text(
                            'Buy data',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ))
                  ],
                ),
              );
            }));
  }

  Container dataPakage(String price, String dataSize) {
    List<String> parts = dataSize.split(' ');
    return Container(
      padding: const EdgeInsets.all(8),
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          color: grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
        onTap: () {
          setState(() {});
        },
        child: Column(children: [
          Expanded(
              child: Text(
            parts[0],
            style: TextStyle(color: black, fontWeight: FontWeight.bold),
          )),
          Text(
            parts[1],
            style: const TextStyle(
                color: primaryColor, fontWeight: FontWeight.w600),
          ),
          Text(
            '${parts[3]} ${parts[4]}',
            style: const TextStyle(color: primaryColor, fontSize: 12),
          )
        ]),
      ),
    );
  }
}
