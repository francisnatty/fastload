import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';

class Transactions extends StatelessWidget {
  const Transactions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: lightBlack.withOpacity(0.1),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Text(
                  'Last Transactions',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Text(
                  'See All',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 13.sp),
                )
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Expanded(
              child: ListView.builder(
                  // padding: EdgeInsets.only(bottom: 10),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.only(bottom: 5),
                      leading: SizedBox(
                        height: 60,
                        width: 60,
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black87),
                          child: const Icon(
                            Icons.air,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      title: Text(
                        'Airtime',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16.sp),
                      ),
                      subtitle: const Text('purchased airtime'),
                      trailing: Column(
                        children: [
                          Text(
                            'N100',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                color: Colors.red),
                          ),
                          Text('10/20/2023'),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
