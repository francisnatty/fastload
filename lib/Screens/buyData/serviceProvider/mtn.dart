import 'package:fastload/Screens/buyData/model/data_model.dart';
import 'package:fastload/bloc/dataPlanBloc/mtn_repository.dart';
import 'package:fastload/bloc/dataPlanBloc/data_bloc.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/utils/utils.dart';
import 'package:fastload/widgets/numTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants/image.dart';
import '../components/internet_error_dialog.dart';

class MtnData extends StatefulWidget {
  final ServiceData? mtnData;
  MtnData({super.key, required this.mtnData});

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
    return SingleChildScrollView(
        child: Column(children: [
      BlocBuilder<DataBloc, DataState>(builder: ((context, state) {
        ServiceData? dataList = state.allNetworks![0];
        if (state.status == DataStateEnum.success) {
          return Wrap(
            spacing: 10,
            runSpacing: 10,
            children: dataList.variations.map((e) {
              String name = e.name;

              return dataPakage(e.code, e.name);
            }).toList(),
          );
        } else if (state.status == DataStateEnum.socketError) {
          return Text('error');
        } else {
          return Container();
        }
      })),
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
          child: Text('Buy Data'),
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
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(white),
            backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
          ),
        ),
      )
    ]));
  }

  Container dataPakage(String price, String dataSize) {
    List<String> parts = dataSize.split(' ');
    return Container(
      padding: const EdgeInsets.only(bottom: 2, top: 2),
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
