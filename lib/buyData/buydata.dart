import 'package:fastload/buyData/buy_data_api.dart';
import 'package:fastload/buyData/model/data_model.dart';
import 'package:flutter/material.dart';

class BuyData extends StatefulWidget {
  const BuyData({super.key});

  @override
  State<BuyData> createState() => _BuyDataState();
}

class _BuyDataState extends State<BuyData> {
  String textValue = '';
  String? dropdownValue;
  List<ServiceVariation>? selectedItem;
  List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];

  // List<DropdownMenuItem<ServiceVariation>> get dropDownItems{
  //   List<>
  // }
  @override
  void initState() {
    // TODO: implement initState
    DataAPI().mtnData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<ServiceData?>(
            future: DataAPI().mtnData(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot != null) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                // } else {
                //   return Center(child: Text('check your internet connection'));
                // }
              }
              final serviceData = snapshot.data;
              List<ServiceVariation> dataList = serviceData!.variations;

              return Column(
                children: [
                  Text(serviceData.convienienceFee.toString()),
                  DropdownButton<List<ServiceVariation>>(
                      value: selectedItem,
                      items: dataList
                          .map<DropdownMenuItem<List<ServiceVariation>>>((e) {
                        return DropdownMenuItem(child: Text(e.amount));
                      }).toList(),
                      onChanged: (List? newItem) {
                        setState(() {
                          // selectedItem = newItem;
                        });
                      })
                ],
              );
            }));
  }
}
