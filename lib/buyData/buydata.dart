import 'package:fastload/buyData/buy_data_api.dart';
import 'package:fastload/buyData/model/data_model.dart';
import 'package:flutter/material.dart';

class BuyData extends StatefulWidget {
  const BuyData({super.key});

  @override
  State<BuyData> createState() => _BuyDataState();
}

class _BuyDataState extends State<BuyData> {
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
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            final serviceData = snapshot.data;

            return ListView.builder(
              itemCount: serviceData!.variations.length,
              itemBuilder: (context, index) {
                return Expanded(
                  child: Row(
                    children: [
                      Text(serviceData!.variations[index].amount),
                      SizedBox(
                        width: 10,
                      ),
                      Text(serviceData!.variations[index].fixedPrice),
                      SizedBox(
                        width: 10,
                      ),
                      Text(serviceData!.variations[index].code),
                      SizedBox(
                        width: 10,
                      ),
                      Text(serviceData!.variations[index].name),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
