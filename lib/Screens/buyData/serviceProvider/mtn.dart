import 'package:fastload/Screens/buyData/model/data_model.dart';
import 'package:fastload/bloc/dataPlanBloc/mtn_repository.dart';
import 'package:fastload/bloc/dataPlanBloc/data_bloc.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/utils/utils.dart';
import 'package:fastload/widgets/myTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/image.dart';
import '../components/internet_error_dialog.dart';

class MtnData extends StatefulWidget {
  const MtnData({super.key});

  @override
  State<MtnData> createState() => _MtnDataState();
}

class _MtnDataState extends State<MtnData> {
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: (context) => DataBloc(
            mtnRepository: MtnRepository(),
          )..add(FetchDataPlans()),
          child: Column(
            children: [
              BlocConsumer<DataBloc, DataState>(listener: (context, state) {
                if (state is DataSocketError) {
                  //  const internetErrorDailog();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const internetErrorDailog();
                      });
                }
              }, builder: (context, state) {
                if (state is DataLoading) {
                  return Center(
                    child: SizedBox(
                      height: 35,
                      width: 35,
                      child: Image.asset(
                        Images.loadingGif,
                      ),
                    ),
                  );
                } else if (state is DataLoaded) {
                  List<ServiceVariation> dataList = state.dataPlans.variations;

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
                      ],
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
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
                      BlocProvider.of<DataBloc>(context)
                        ..add(BuyData(
                            serviceId: 'mtn-data',
                            variationCode: 'mtn-10mb-100',
                            billersCode: 08011111111,
                            phoneNum: 08011111111));
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      foregroundColor: MaterialStateProperty.all<Color>(white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor),
                    ),
                    child: BlocConsumer<DataBloc, DataState>(
                      listener: (context, state) {
                        if (state is BuyDataError) {
                          Utils.showSnackBar(context, state.error.toString());
                        } else if (state is BuyDataSocketError) {
                          const internetErrorDailog();
                        }
                      },
                      builder: (context, state) {
                        if (state is BuyDataLoading) {
                          return SizedBox(
                              width: 20,
                              height: 20,
                              child: Image.asset(Images.loadingGif));
                        } else {
                          return const Text(
                            'Buy data',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          );
                        }
                      },
                    ),
                  ))
            ],
          ),
        ));
  }

  Container dataPakage(String price, String dataSize) {
    List<String> parts = dataSize.split(' ');
    return Container(
      padding: const EdgeInsets.all(8),
      height: 80,
      width: 80,
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(20)),
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
