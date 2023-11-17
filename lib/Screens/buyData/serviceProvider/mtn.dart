import 'package:fastload/bloc/dataPlanBloc/mtn_repository.dart';
import 'package:fastload/bloc/dataPlanBloc/data_bloc.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/utils/utils.dart';
import 'package:fastload/widgets/myTextField.dart';
import 'package:fastload/widgets/numTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants/image.dart';
import '../components/internet_error_dialog.dart';

class MtnData extends StatefulWidget {
  const MtnData({super.key});

  @override
  State<MtnData> createState() => _MtnDataState();
}

class _MtnDataState extends State<MtnData> {
  TextEditingController phoneController = TextEditingController();
  String variationCode = '';
  int? billersCode = 08011111111;
  int? phoneNum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => DataBloc(
              mtnRepository: MtnRepository(),
            )..add(FetchDataPlans()),
            child:
                BlocConsumer<DataBloc, DataState>(listener: (context, state) {
              if (state.status == DataStateEnum.error) {
                Utils.showSnackBar(context, state.error.toString());
              } else if (state.status == DataStateEnum.socketError) {
                const internetErrorDailog();
              }
              // if (state is DataSocketError) {
              //   //  const internetErrorDailog();
              //   showDialog(
              //       context: context,
              //       builder: (context) {
              //         return const internetErrorDailog();
              //       });
              // }
            }, builder: (context, state) {
              return Column(children: [
                if (state.status == DataStateEnum.fetchingData)
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.4,
                    child: Center(
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: Image.asset(
                          Images.loadingGif,
                        ),
                      ),
                    ),
                  )
                else if (state.dataPlans != null)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: state.dataPlans!.variations.map((e) {
                            String name = e.name;

                            //  print(e.code);

                            return dataPakage(e.code, e.name);
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                else if (state.status == DataStateEnum.socketError)
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.4,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'uh oh,Poor internet Connection',
                            style: TextStyle(
                                color: white, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'TRY AGAIN',
                            style: TextStyle(color: grey),
                          ),
                          const Icon(
                            Iconsax.repeat_circle4,
                            color: primaryColor,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  )
                else
                  const SizedBox.shrink(),
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
                        if (phoneController.text.length != 11 &&
                            variationCode.isEmpty &&
                            billersCode != null) {
                          context.read<DataBloc>().add(BuyData(
                              serviceId: 'mtn-data',
                              variationCode: variationCode,
                              billersCode: 08011111111,
                              phoneNum: int.parse(phoneController.text)));
                        } else {
                          Utils.showSnackBar(context, 'Input not complete');
                        }
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primaryColor),
                      ),
                      child: state.status == DataStateEnum.buyingData
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: Image.asset(Images.loadingGif))
                          : const Text(
                              'Buy data',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                )
              ]);
            }),
          ),
        ));
  }

  Container dataPakage(String price, String dataSize) {
    List<String> parts = dataSize.split(' ');
    return Container(
      padding: EdgeInsets.only(bottom: 2, top: 2),
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(20)),
        child: GestureDetector(
          onTap: () {
            setState(() {
              variationCode = price;
              print(variationCode);
            });
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
      ),
    );
  }
}
