import 'package:fastload/Screens/buyData/mtn.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/constants/image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DataTab extends StatefulWidget {
  const DataTab({super.key});

  @override
  State<DataTab> createState() => _DataTabState();
}

class _DataTabState extends State<DataTab> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController controller = TabController(length: 4, vsync: this);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text(
            'Buy Data',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25)),
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: controller,
                    labelPadding: EdgeInsets.all(10),
                    unselectedLabelColor: black,
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    labelColor: Colors.white,
                    indicator: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(25.0)),
                    tabs: [
                      Tab(
                        text: 'Mtn',
                      ),
                      Tab(
                        text: 'Airtel',
                      ),
                      Tab(
                        text: 'Glo',
                      ),
                      Tab(
                        text: '9mobile',
                      ),
                    ]),
              ),
              Expanded(
                  child: TabBarView(controller: controller, children: [
                MtnData(),
                Container(child: Text('Grace')),
                Container(child: Text('Eliz')),
                Container(child: Text('Gbariel')),
              ]))
              // _tabSelection(context, controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabSelection(BuildContext context, TabController controller) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: const Border.fromBorderSide(
                      BorderSide(color: Colors.pink)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: TabBar(
                  controller: controller,
                  indicatorColor: primaryColor,
                  tabs: [
                    Tab(
                        icon: CircleAvatar(
                      backgroundImage: Image.asset(Images.mtn).image,
                    )),
                    Tab(
                        icon: CircleAvatar(
                      backgroundImage: Image.asset(Images.airtel).image,
                    )),
                    Tab(
                        icon: CircleAvatar(
                      backgroundImage: Image.asset(Images.glo).image,
                    )),
                    Tab(
                        icon: CircleAvatar(
                      backgroundImage: Image.asset(Images.mobile).image,
                    )),
                  ]),
            ),
          ),
          Container(
            height: double.infinity,
            child: Flexible(
              child: TabBarView(controller: controller, children: <Widget>[
                Container(child: Text('Natty')),
                Container(child: Text('Natty')),
                Container(child: Text('Natty')),
                Container(child: Text('Natty')),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
