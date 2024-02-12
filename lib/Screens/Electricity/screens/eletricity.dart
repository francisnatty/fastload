import 'package:fastload/Screens/Electricity/widgets/postpaid.dart';
import 'package:fastload/Screens/Electricity/widgets/prepaid.dart';
import 'package:fastload/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElectricityPage extends StatefulWidget {
  const ElectricityPage({super.key});

  @override
  State<ElectricityPage> createState() => _ElectricityPageState();
}

class _ElectricityPageState extends State<ElectricityPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            'Electricity',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.sp),
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 45.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.withOpacity(0.3)),
                child: TabBar(
                    indicator: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(25)),
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: tabController,
                    labelStyle: const TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: 'Montserrat'),
                    unselectedLabelColor: black,
                    labelColor: white,
                    tabs: const [
                      Tab(
                        text: 'Prepaid',
                      ),
                      Tab(
                        text: 'Postpaid',
                      ),
                    ]),
              ),
              Expanded(
                  child: TabBarView(
                controller: tabController,
                children: const [
                  PrepaidPage(serviceType: 'prepaid'),
                  PostPaid(serviceType: 'postpaid'),
                ],
              ))
              // SuccessDialog(),
            ],
          ),
        ),
      ),
    );
  }
}
