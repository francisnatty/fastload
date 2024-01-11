import 'package:fastload/bloc/tv/tv_bloc.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class TvSmartCard extends StatefulWidget {
  final String variationCode;
  final double variationAmount;
  final String serviceId;
  const TvSmartCard(
      {required this.serviceId,
      required this.variationAmount,
      required this.variationCode,
      super.key});

  @override
  State<TvSmartCard> createState() => _TvSmartCardState();
}

class _TvSmartCardState extends State<TvSmartCard> {
  TextEditingController cardNum = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    cardNum.dispose();
    super.dispose();
  }

  String status = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Purchase',
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter SmartCard Num'),
            TextField(
              controller: cardNum,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
              decoration: InputDecoration(
                  hintText: 'SmartCard Num',
                  contentPadding: EdgeInsets.all(5.0),
                  hintStyle:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20.r)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: primaryColor, width: 1.0),
                      borderRadius: BorderRadius.circular(20.r)),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.4)),
              onEditingComplete: () {
                context.read<TvBloc>().add(VerifySmartCard(cardNum: {
                      'billersCode': int.tryParse(cardNum.text),
                      'serviceID': 'dstv',
                    }));
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            BlocConsumer<TvBloc, TvState>(
              listener: (context, state) {
                if (state is VerifyCardError) {
                  showSnackBar(context, state.error);
                }
              },
              builder: (context, state) {
                if (state is VerifyCardLoading) {
                  return Center(
                    child: SizedBox(
                      height: 25.h,
                      width: 25.h,
                      child: const CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    ),
                  );
                } else if (state is VerifyCardError) {
                  return Text(state.error);
                } else if (state is VerifyCardSuccess) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_box,
                              color: primaryColor,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              state.status.customerName.toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.sp),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
            SizedBox(
              height: 100.h,
            ),
            SizedBox(
              width: 390.w,
              height: 65.h,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {},
                  child: Text(
                    'Proceed',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                  )),
            )
          ],
        )),
      ),
    );
  }
}
