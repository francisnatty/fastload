import 'package:fastload/Model/tv_model.dart';
import 'package:fastload/Screens/tv/tv_view.dart';
import 'package:fastload/bloc/tv/tv_bloc.dart';
import 'package:fastload/constants/colors.dart';
import 'package:fastload/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tv extends StatefulWidget {
  const Tv({super.key});

  @override
  State<Tv> createState() => _TvState();
}

class _TvState extends State<Tv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBack,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Tv Subscription',
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocConsumer<TvBloc, TvState>(
        listener: ((context, state) {
          if (state is TvError) {
            showSnackBar(context, state.error);
          }
        }),
        builder: (context, state) {
          if (state is TvLoading) {
            return Center(
              child: showLoadingIndicator(),
            );
          } else if (state is TvSucess) {
            List<TvModel> subs = state.subs;

            return DefaultTabController(
                length: state.subs.length,
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
                              // controller: controller,

                              labelPadding: const EdgeInsets.all(10),
                              unselectedLabelColor: black,
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                  fontFamily: 'Montserrat'),
                              labelColor: Colors.white,
                              dividerColor: Colors.transparent,
                              indicator: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(25.0)),
                              tabs: List.generate(state.subs.length, (index) {
                                return Tab(
                                  text: state.subs[index].serviceName
                                      .split(" ")
                                      .first,
                                );
                              })),
                        ),
                        Expanded(
                          child: TabBarView(
                            // controller: controller,
                            children: List.generate(state.subs.length, (index) {
                              return TvView(subPlans: state.subs[index]);
                            }),
                          ),
                        ),

                        // _tabSelection(context, controller),
                      ],
                    )));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
