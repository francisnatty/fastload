import 'package:fastload/Screens/Electricity/Api/electric_api.dart';
import 'package:fastload/Screens/Electricity/bloc/dailod.dart';
import 'package:fastload/Screens/Electricity/bloc/sucessbloc.dart';
import 'package:fastload/Screens/Electricity/prepaid.dart';
import 'package:fastload/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElectricityPage extends StatefulWidget {
  const ElectricityPage({super.key});

  @override
  State<ElectricityPage> createState() => _ElectricityPageState();
}

class _ElectricityPageState extends State<ElectricityPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ElectricityApi().validateMeterNumber();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text(
            'Electricity',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.withOpacity(0.3)),
                child: TabBar(
                    indicator: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(25)),
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: tabController,
                    labelStyle: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: 'Montserrat'),
                    unselectedLabelColor: black,
                    labelColor: white,
                    tabs: [
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
                children: [
                  PrepaidPage(),
                  Text('Natty'),
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
