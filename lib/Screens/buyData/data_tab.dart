import 'package:fastload/Screens/buyData/model/data_model.dart';
import 'package:fastload/Screens/buyData/serviceProvider/airtel.dart';
import 'package:fastload/Screens/buyData/serviceProvider/glo.dart';
import 'package:fastload/Screens/buyData/serviceProvider/mtn.dart';
import 'package:fastload/Screens/buyData/serviceProvider/ninemobile.dart';
import 'package:fastload/bloc/dataPlanBloc/data_bloc.dart';
import 'package:fastload/bloc/dataPlanBloc/mtn_repository.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/constants/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataTab extends StatefulWidget {
  const DataTab({super.key});

  @override
  State<DataTab> createState() => _DataTabState();
}

class _DataTabState extends State<DataTab> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController controller = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: greyBack,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Buy Data',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            DataBloc(dataRepository: DataRepository())..add(FetchDataPlans()),
        child: BlocBuilder<DataBloc, DataState>(
          builder: (context, state) {
            // ServiceData? mtn = state.allNetworks![0];
            if (state.status == DataStateEnum.initial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == DataStateEnum.error) {
              return const Center(child: Text('error'));
            }

            return DefaultTabController(
              length: state.allNetworks!.length,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          controller: controller,
                          labelPadding: const EdgeInsets.all(10),
                          unselectedLabelColor: black,
                          labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                          labelColor: Colors.white,
                          dividerColor: Colors.transparent,
                          indicator: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(25.0)),
                          tabs:
                              List.generate(state.allNetworks!.length, (index) {
                            return Tab(
                              text: state.allNetworks![index].serviceName
                                  .split(" ")
                                  .first,
                            );
                          })),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: controller,
                        children:
                            List.generate(state.allNetworks!.length, (index) {
                          return Data(mtnData: state.allNetworks![index]);
                        }),
                      ),
                    ),

                    // _tabSelection(context, controller),
                  ],
                ),
              ),
            );
          },
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
          SizedBox(
            height: double.infinity,
            child: Flexible(
              child: TabBarView(controller: controller, children: <Widget>[
                Container(child: const Text('Natty')),
                Container(child: const Text('Natty')),
                Container(child: const Text('Natty')),
                Container(child: const Text('Natty')),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
