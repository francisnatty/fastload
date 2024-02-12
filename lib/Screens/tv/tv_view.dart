import 'package:fastload/Model/tv_model.dart';
import 'package:fastload/Screens/tv/enter_smartcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TvView extends StatefulWidget {
  final TvModel subPlans;
  const TvView({super.key, required this.subPlans});

  @override
  State<TvView> createState() => _TvViewState();
}

class _TvViewState extends State<TvView> {
  @override
  Widget build(BuildContext context) {
    TvModel tv = widget.subPlans;
    List<Variation> subList = tv.variations;
    return ListView.builder(
        shrinkWrap: true,
        itemCount: subList.length,
        itemBuilder: (context, index) {
          String amt = subList[index].variationAmount;
          // int? variationAmount = int.tryParse(amt);
          return Card(
            elevation: 5.0,
            surfaceTintColor: Colors.white,
            child: ListTile(
                leading: SizedBox(
                  height: 35.h,
                  width: 35.h,
                  child: CircleAvatar(
                    backgroundImage: Image.asset(subList[index].img).image,
                  ),
                ),
                title: Text(
                  subList[index].name,
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 25.r,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TvSmartCard(
                                  serviceId: tv.serviceID,
                                  variationAmount: 1850,
                                  variationCode: subList[index].variationCode,
                                )));
                  },
                )),
          );
        });
  }
}
